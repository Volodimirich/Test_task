import logging
import os
import sys

from yaml import safe_load
import sqlalchemy
from sqlalchemy.exc import SQLAlchemyError


def get_config(path: str) -> dict:
    with open(path, 'r') as stream:
        config = safe_load(stream)
    return config


def get_db_params() -> tuple:
    if all(var in os.environ for var in ['POSTGRES_USER', 'POSTGRES_PASSWORD',
                                         'POSTGRES_NAME']):
        user, password, name = os.environ['POSTGRES_USER'], \
                               os.environ['POSTGRES_PASSWORD'], \
                               os.environ['POSTGRES_NAME']
    else:
        user, password, name = 'postgres', 'postgres', 'localhost'
    return user, password, name


def check_db_connection(engine: sqlalchemy.engine.base.Engine,
                        logger: logging.Logger) -> None:
    try:
        _ = engine.connect()
        logger.info('Database connected')
    except SQLAlchemyError as err:
        logger.critical(f'Error in database connection - {err.__cause__}')
        sys.exit(-1)
