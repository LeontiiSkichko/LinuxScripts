# EDBHU

A script for daily backup of one or more folders into a single archive.

## Installation

### Clone the repository from Git.

`git clone https://github.com/LeontiiSkichko/LinuxScripts.git`

### Go to the cloned folder from Git

`cd /home/USER_NAME/LinuxScripts-main/`

### Granting execution rights to scripts.

`chmod 755 /home/USERNAME/LinuxScripts-main/EveryDayBackupHomeUser.sh`

`chmod 755 /home/USERNAME/LinuxScripts-main/EDBHUinstaller.sh`

### Setting up backup.yaml

#### WHAT_TAKE:

The full path to the folder to add to the archive. If you need to add more than one folder to a single archive, specify multiple paths.

#### BACKUP_TO:

The path to the folder for storing backups.

#### MAX_VALUE:

The maximum number of backups to store.

#### FILE_NAME:

Specify a prefix for the backups.

### An example of a finished file is presented below.

```yaml
WHAT_TAKE:
  - "/home/USERNAME/Backup/TEST"
  - "/home/USERNAME/Backup1/TEST1"
  - "/home/USERNAME/Backup2/TEST2"
BACKUP_TO: "home/USERNAME/Backups"
MAX_VALUE: 3
FILE_NAME: "EDBHU"
```

### Run the installer

`./EDBHUistaller.sh`

### After running the installer, the folder where the project was originally file can be deleted