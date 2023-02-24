import argparse
import os.path

import pandas as pd
import logging.config
from config.logger_config import config
from sqlalchemy import create_engine
from sqlalchemy.exc import SQLAlchemyError
import gdown
from yaml import safe_load
from pathlib import Path


logging.config.dictConfig(config)


def download_data(output: str) -> None:
    Path(output).parent.mkdir(parents=True, exist_ok=True)
    url = 'https://drive.google.com/uc?id=1XaJX4KASYre58NfeVJSNmIyqM_Q683AU'
    gdown.download(url, output, quiet=False)


def get_config(path: str) -> dict:
    with open(path, 'r') as stream:
        config = safe_load(stream)
    return config


def load_data(file: str, translate_dict: dict) -> pd.DataFrame:
    if not os.path.exists(file):
        logger.info(f'Downloading {file}')
        download_data(file)
    print(file)
    df = pd.read_excel(file, engine='openpyxl', header=3, skiprows=[4],
                       parse_dates=True)
    logger.info(f'{file} loaded')
    if set(df.columns) != translate_dict.keys():
        print('!')
        logger.error('Translate dict has different columns, '
                     'maybe you chose the wrong file, exit')
        exit(-1)
    else:
        df.rename(columns=translate_dict, inplace=True)
    return df


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--fl", help='Filename', default='data/data.xlsx')
    parser.add_argument("--tr_dict", help='Path to translate dict',
                        default='config/translate_config.yml')
    args = parser.parse_args()
    file, tr_dict_path = args.fl, args.tr_dict

    translate_dict = get_config(tr_dict_path)
    logger = logging.getLogger('file_logger')

    df = load_data(file, translate_dict)
    engine = create_engine("postgresql://postgres:postgres@db")
    try:
        conn = engine.connect()
        logger.info('Database connected')
    except SQLAlchemyError as err:
        logger.error(f'Error in database connection - {err.__cause__}')
        print(err.__cause__)
        exit(-1)

    df.to_sql('overdue', engine, if_exists='replace')
