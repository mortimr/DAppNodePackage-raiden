#!/bin/sh
set -e

# Check if password is set, and at least one file has been uploaded
if [ -n "${RAIDEN_ADDRESS}" ] && [ -n "${RAIDEN_KEYSTORE_PASSWORD}" ] && [ "$(find . -maxdepth 1 -type f | wc -l)" -gt 0 ]; then
    echo "${RAIDEN_KEYSTORE_PASSWORD}" > .password
    /opt/venv/bin/python3 -m raiden --keystore-path . --password-file .password "${RAIDEN_EXTRA_OPTS}"
else
    echo
    echo "########################################################"
    echo "## Raiden not configured to start!                    ##"
    echo "## Please follow the following steps:                 ##"
    echo "## 1: Upload a keystore file to /root/.raiden         ##"
    echo "## 2: Set the RAIDEN_ADDRESS of the keystore          ##"
    echo "## 3: Set the RAIDEN_KEYSTORE_PASSWORD to open it     ##"
    echo "## 4: Restart the package                             ##"
    echo "########################################################"
    while true; do sleep 5; done
fi