FROM python:latest

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY config config
COPY utils utils
COPY preprocessing.py bot.py ./

CMD python preprocessing.py && python bot.py
#ENTRYPOINT python bot.py