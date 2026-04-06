#!/bin/bash

YAML_FILE="$HOME/.config/EDBHU/backup.yaml"
TIME="$(date +%Y-%m-%d-%H-%M-%S)"

if [ -f "$YAML_FILE" ]; then
    FILE_NAME=$(yq ".FILE_NAME" backup.yaml)
    MAX_VALUE=$(yq ".MAX_VALUE" backup.yaml)
    BACKUP_TO=$(yq ".BACKUP_TO" backup.yaml)
    WHAT_TAKE=$(yq ".WHAT_TAKE[]" backup.yaml)
else
    echo "YAML_FILE is not found."
    exit 1
fi

if [ -z "$BACKUP_TO" ]; then
    mkdir -p BackupsHere
    BACKUP_TO=$(pwd)/BackupsHere
fi

for ITEM in "${WHAT_TAKE[@]}"; do
    if [ -n "$ITEM" ]; then
	if [ -e "$ITEM" ]; then
            CLEAN_LIST+=( "$ITEM" )
        fi
    fi
done

if [ -z "$CLEAN_LIST" ]; then
    echo "Target backup file is missing."
    exit 2
fi

if [ -z "$MAX_VALUE" ]; then
    echo "Either the MAX_VALUE variable is not defined, or its value is not specified."
    exit 3
fi

((MAX_VALUE++))

tar --same-owner -pczf "$BACKUP_TO/"$FILE_NAME""$TIME".tar.gz" -P "${CLEAN_LIST[@]}"
ls -t "$BACKUP_TO" | grep ""$FILE_NAME".*.tar.gz" | tail -n +$MAX_VALUE | xargs -I {} rm -r "$BACKUP_TO/{}"
echo "Backup completed: "$FILE_NAME""$TIME".tar.gz"
