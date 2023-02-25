### Launch:
```
docker-compose --env-file .env up 
```

### Telegram bot:
[Telegram bot link](https://t.me/TestProblemTaskBot)

### Structure:
```angular2html
.
├── Dockerfile #Dockerfile with preprocessing-bot logic
├── ReadMe.md 
├── bot.py # Bot script
├── .env - # File with env variables
├── config
│   ├── logger_config.py #Config fo logger
│   └── translate_config.yml #Config with russian-eng column translation
├── docker-compose.yml 
├── preprocessing.py # Preprocessing script
├── requirements.txt # Project requirements
└── utils 
    └── utils.py #Utils functions

```

### .env file:
**POSTGRES_USER** - db user \
**POSTGRES_PASSWORD** - db password \
**POSTGRES_NAME** - db host \
**TBOT_TOKEN** - telegram bot token \
**GDRIVE_LINK** - google drive link to data