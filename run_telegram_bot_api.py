#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Author: ArianOmrani - https://github.com/arian24b/
# Git repository: https://github.com/arian24b/telegrambotapi

from subprocess import run, CalledProcessError
from tempfile import mkdtemp
from os import rmdir


# Configuration
API_ID = '123456'
API_HASH = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
HTTP_PORT = '5687'

# Create a temporary directory
temp_dir = mkdtemp(prefix="telegram-bot-api-")

# Path to the telegram-bot-api binary
telegram_bot_api_binary = '/home/arian/backup/telegram-bot-api'

# Arguments to pass to the telegram-bot-api binary
args = [
    telegram_bot_api_binary,
    f'--api-id={API_ID}',
    f'--api-hash={API_HASH}',
    f'--http-port={HTTP_PORT}',
    f'--dir={temp_dir}',
    f'--temp-dir={temp_dir}',
    '--local'
]

# Execute the telegram-bot-api binary with the specified arguments
try:
    run(args, check=True)
except CalledProcessError as e:
    print(f"An error occurred: {e}")
finally:
    # Clean up the temporary directory if needed
    rmdir(temp_dir)
