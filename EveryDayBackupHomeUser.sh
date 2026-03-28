#!/bin/bash

CONFIG_FILE="$HOME/LinuxScripts-main/.backup.cfg"

if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "No config - no problem?"
    exit 1
fi

if [ -z "$backup_to" ]; then
    mkdir -p BackupsHere
    backup_to=$(pwd)/BackupsHere
fi

if [ -z "$WHAT_TAKE" ]; then
    echo "So, what I need backup?"
    exit 1
fi
((max_value++))

tar --same-owner -pczf "$backup_to/EDBHU$(date +%Y-%m-%d-%H:%M:%S).tar.gz" -C "$(dirname "$WHAT_TAKE")" "$(basename "$WHAT_TAKE")"
ls -t "$backup_to" | grep "EDBHU.*.tar.gz" | tail -n +$max_value | xargs -I {} rm -r "$backup_to/{}"
echo "Backup completed: EDBHU$(date +%Y-%m-%d-%H:%M:%S).tar.gz"
