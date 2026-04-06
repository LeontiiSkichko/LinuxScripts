#!/bin/bash

path_to_main="$(pwd)"
mkdir EDBHU $HOME/.config/

cd "$path_to_main"
mv backup.yaml $HOME/.config/EDBHU/
mv EveryDayBackupHomeUser.sh /etc/cron.daily/
