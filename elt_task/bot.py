from sqlalchemy import create_engine
import telebot
import argparse
import pandas as pd
import os


bot = telebot.TeleBot('6108032700:AAFeCamKCaR_P6_KUA-TUaiGnLDgx0grSGg')
is_preprocessed = False
filename = 'output.xlsx'


def create_document(filename='output.xlsx'):
    engine = create_engine("postgresql://postgres:postgres@db")
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


@bot.message_handler(commands=['start'])
def send_welcome(message):
    bot.reply_to(message, 'Hi there, I am ReportBot. Please send "/report"'
                          ' command')


@bot.message_handler(commands=['report'])
def get_text_messages(message):
    if not is_preprocessed or not os.path.exists(filename) or True:
        create_document(filename)
    with open(filename, 'rb') as f:
        bot.send_document(message.chat.id, f)


@bot.message_handler(content_types='text')
def message_reply(message):
    bot.send_message(message.chat.id, "Please, use /report command")


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--pr", help="Preprocessing mode", type=bool,
                        default=True)
    parser.add_argument("--fl", help='Filename', default='output.xlsx')
    args = parser.parse_args()
    is_preprocessed, filename = args.pr, args.fl

    bot.infinity_polling()
