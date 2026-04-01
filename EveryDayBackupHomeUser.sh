#!/bin/bash

CONFIG_FILE="$HOME/.config/EDBHU/backup.cfg"
TIME="EDBHU$(date +%Y-%m-%d-%H-%M-%S)"

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

for item in "${WHAT_TAKE[@]}"; do
    if [ -n "$item" ]; then
	if [ -e "$item" ]; then
            clean_list+=( "$item" )
        fi
    fi
done

if [ -z "$clean_list" ]; then
    echo "So, what I need backup?"
    exit 1
fi

((max_value++))

tar --same-owner -pczf "$backup_to/"$TIME".tar.gz" -P "${clean_list[@]}"
ls -t "$backup_to" | grep "EDBHU.*.tar.gz" | tail -n +$max_value | xargs -I {} rm -r "$backup_to/{}"
echo "Backup completed: "$TIME".tar.gz"
