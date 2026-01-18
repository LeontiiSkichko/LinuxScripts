#!/bin/bash

CONFIG_FILE="$HOME/.everyday_backup_config.cfg"
COUNT=$(echo "$BACKUPS" | wc -l)

if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "А где собственно сам конфиг?"
    exit 1
fi

if [ "$COUNT" -gt "$MAX_VALUE" ]; then
    DELETE_COUNT=$((COUNT - MAX_VALUE))
    OLD_BACKUPS=$(echo "$BACKUPS" | head -n "$DELETE_COUNT")
    
    echo "Старые бекапы собираются на пенсию..."
    for backup in $OLD_BACKUPS; do
        rm -rf "$BACKUP_TO/$backup"
    done
fi

ls -t "$BACKUP_TO" | tail -n +$MAX_VALUE | xargs -I {} rm -rf "$BACKUP_TO/{}"
tar -pczf "$BACKUP_TO/DocumentsBackup_$(date +%Y-%m-%d-%H:%M:%S).tar.gz" -C "$(dirname "$WHAT_TAKE")" "$(basename "$WHAT_TAKE")"
echo "Backup completed: DocumentsBackup_$(date +%Y-%m-%d-%H:%M:%S).tar.gz"
