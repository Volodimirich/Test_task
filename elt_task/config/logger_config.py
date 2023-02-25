config = {
    'version': 1,
    'formatters': {
        'file': {
            'format': '%(asctime)s - %(name)s - %(levelname)s - %(message)s',
        }
    },
    'handlers': {
        'preprocessing': {
            'class': 'logging.FileHandler',
            'level': 'INFO',
            'filename': 'logs.log',
            'formatter': 'file',

        },
        'bot': {
            'class': 'logging.FileHandler',
            'level': 'INFO',
            'filename': 'logs.log',
            'formatter': 'file',

        }

    },
    'loggers': {
        'preprocessing': {
            'level': 'INFO',
            'handlers': ['preprocessing'],
        },
        'bot': {
            'level': 'INFO',
            'handlers': ['bot'],
        }
    },
}