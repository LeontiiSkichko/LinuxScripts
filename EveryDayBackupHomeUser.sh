#!/bin/bash

CONFIG_FILE="$HOME/LinuxScripts/.everyday_backup_config.cfg"

if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "А где собственно сам конфиг?"
    exit 1
fi

ls -t "$BACKUP_TO" | grep ".tar.gz" | tail -n +$MAX_VALUE | xargs -I {} rm -rf "$BACKUP_TO/{}"
tar -pczf "$BACKUP_TO/$(date +%Y-%m-%d-%H:%M:%S).tar.gz" -C "$(dirname "$WHAT_TAKE")" "$(basename "$WHAT_TAKE")"
echo "Backup completed: $(date +%Y-%m-%d-%H:%M:%S).tar.gz"
