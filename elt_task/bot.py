import logging.config

from sqlalchemy import create_engine
import telebot
import argparse
import pandas as pd
import os

from config.logger_config import config
from utils.utils import get_config, get_db_params, check_db_connection

logging.config.dictConfig(config)
logger = logging.getLogger('bot')

if 'TBOT_TOKEN' not in os.environ:
    logger.critical("Can't find env TBOT_TOKEN, exit")
    print("Can't find tbot_token in env")
    exit(-1)

bot = telebot.TeleBot(os.environ['TBOT_TOKEN'])
logger.info(f"Bot loaded, token = {os.environ['TBOT_TOKEN']}")
is_preprocessed = False
filename = 'output.xlsx'


def create_document(filename: str = 'output.xlsx'):
    user, password, name = get_db_params()
    engine = create_engine(f"postgresql://{user}:{password}@{name}")
    check_db_connection(engine, logger)

    answer = engine.execute('SELECT subject AS "Субъект",'
                            'SUM(doses_amount) '
                            'AS "Суммарное количество доз",'
                            'AVG(days_overdue) AS "Среднее просрочено дней"'
                            ' FROM overdue Group By subject ORDER BY subject;')
    columns = answer.keys()
    data = answer.fetchall()

    df = pd.DataFrame(data, columns=columns)
    df[["Суммарное количество доз", "Среднее просрочено дней"]] = \
        df[["Суммарное количество доз",
            "Среднее просрочено дней"]].astype('float').round().astype('int')
    writer = pd.ExcelWriter(filename)
    df.to_excel(writer, sheet_name='Sheet 1', index=False)

    for column in df:
        column_width = max(df[column].astype(str).map(len).max(), len(column))
        col_idx = df.columns.get_loc(column)
        writer.sheets['Sheet 1'].set_column(col_idx, col_idx, column_width)

    writer.save()
    logger.info('Excel file is ready')


@bot.message_handler(commands=['start'])
def send_welcome(message):
    bot.reply_to(message, 'Hi there, I am ReportBot. Please send "/report"'
                          ' command')
    logger.info(f'Sending hello message, chat id - {message.chat.id}')


@bot.message_handler(commands=['report'])
def get_text_messages(message):
    if not is_preprocessed or not os.path.exists(filename) or True:
        create_document(filename)
    with open(filename, 'rb') as f:
        bot.send_document(message.chat.id, f)
    logger.info(f'Sending file message, chat id - {message.chat.id}')


@bot.message_handler(content_types='text')
def message_reply(message):
    bot.send_message(message.chat.id, "Please, use /report command")
    logger.info(f'Wrong message, chat id - {message.chat.id}')


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--pr", help="Preprocessing mode", type=bool,
                        default=True)
    parser.add_argument("--fl", help='Filename', default='output.xlsx')

    args = parser.parse_args()
    is_preprocessed, filename = args.pr, args.fl
    bot.infinity_polling()
