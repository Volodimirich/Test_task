import argparse
import os
import sys

import pandas as pd
import logging.config
from sqlalchemy import create_engine
import gdown
from pathlib import Path

from config.logger_config import config
from utils.utils import get_config, get_db_params, check_db_connection

logging.config.dictConfig(config)
logger = logging.getLogger('preprocessing')


def download_data(output: str) -> None:
    if 'GDRIVE_LINK' not in os.environ:
        print('Gdrive link not in env')

    Path(output).parent.mkdir(parents=True, exist_ok=True)
    gdown.download(os.environ['GDRIVE_LINK'], output, quiet=False)


def load_data(filename: str, trans_dict: dict) -> pd.DataFrame:
    if not os.path.exists(filename):
        logger.info('Downloading %s', filename)
        download_data(filename)
    df = pd.read_excel(filename, engine='openpyxl', header=3, skiprows=[4],
                       parse_dates=True)
    logger.info('%s loaded', filename)
    if set(df.columns) != trans_dict.keys():
        logger.critical('Translate dict has different columns, '
                        'maybe you chose the wrong file, exit')
        sys.exit(-1)
    else:
        df.rename(columns=trans_dict, inplace=True)
        logger.info('Database is ready, returning from load_data')
    return df


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--fl", help='Filename', default='data/data.xlsx')
    parser.add_argument("--tr_dict", help='Path to translate dict',
                        default='config/translate_config.yml')
    args = parser.parse_args()
    file, tr_dict_path = args.fl, args.tr_dict

    translate_dict = get_config(tr_dict_path)

    data_df = load_data(file, translate_dict)
    user, password, name = get_db_params()
    engine = create_engine(f'postgresql://{user}:{password}@{name}')
    check_db_connection(engine, logger)
    data_df.to_sql('overdue', engine, if_exists='replace')
    logger.info('Preprocessing finished')
