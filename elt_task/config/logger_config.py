config = {
    'version': 1,
    'formatters': {
        'file': {
            'format': '%(asctime)s - %(name)s - %(levelname)s - %(message)s',
        }
    },
    'handlers': {
        'file_handler': {
            'class': 'logging.FileHandler',
            'level': 'INFO',
            'filename': 'preprocessing.log',
            'formatter': 'file',

        }
    },
    'loggers': {
        'file_logger': {
            'level': 'INFO',
            'handlers': ['file_handler'],
        }
    },
}