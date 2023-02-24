FROM python:latest

#WORKDIR /app
#ENV TELEGRAM_BOT_botname ТОКЕН_ВАШЕГО_БОТА

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY config config
COPY preprocessing.py bot.py ./

CMD ls
#CMD ./python preprocessing.py & ./python bot.py
