#!/bin/bash

CONFIG_FILE="$HOME/LinuxScripts-main/.backup.cfg"

if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "А где собственно сам конфиг?"
    exit 1
fi

((maxvalue++))

ls -t "$BACKUP_TO" | grep "EDBHU.*.tar.gz" | tail -n +$max_value | xargs -I {} rm -r "$BACKUP_TO/{}"
tar -pczf "$BACKUP_TO/EDBHU$(date +%Y-%m-%d-%H:%M:%S).tar.gz" -C "$(dirname "$WHAT_TAKE")" "$(basename "$WHAT_TAKE")"
echo "Backup completed: EDBHU$(date +%Y-%m-%d-%H:%M:%S).tar.gz"
