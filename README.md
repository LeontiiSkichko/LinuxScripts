.gitignore - Added to Git to ensure backups are not committed.

EDBHUinstaller.sh - It`s installer, script for transfer files to other directories.

EveryDayBackupHomeUser.sh - Main script for backup.

backup.cfg - Here you write what "WHAT_TAKE", where "backup to" should be copied and how many copies should be kept at the same time "max_value".

After configuring backup.cfg, grant the script permissions:

chmod 755 /home/MY_USER/LinuxScripts-main/EDBHUinstaller.sh chmod 755 /home/MY_USER/LinuxScripts-main/EveryDayBackupHomeUser.sh

Run the script with the command

./EDBHUinstaller.sh
