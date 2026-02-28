
<!-- toc -->

- [Arch – Automated Google Drive Backup Setup (Safe Copy Mode)](#arch--automated-google-drive-backup-setup-safe-copy-mode)

<!-- tocstop -->
#Arch – Automated Google Drive Backup Setup (Safe Copy Mode)
This guide explains how to set up rclone on Arch-based systems (e.g., Omarchy) to automatically back up files while maintaining a manual "on-demand" command with full progress details.

1. Install & Configure rclone
```bash

sudo pacman -S rclone
rclone config
Name: ouslgdrive
```

`
type: drive
`
`Scope: 1 (Full access)`

`Authentication: Follow the browser prompts.`

2. Create the Enhanced Backup Script
This script is optimized for Omarchy. It shows you exactly what is happening in the terminal while still saving a copy to your logs.

Create/Edit the script: 

```bash
nvim ~/scripts/backup_to_gdrive.sh
```
Paste the following:
```Bash
#!/bin/bash
# Backup /mnt/Files/Backup to Google Drive "Fedora Backup" folder
# SAFE MODE: Uses 'copy' so local deletions do NOT remove files from Google Drive.

LOCAL_FOLDER="/mnt/Files/Backup"
REMOTE_REMOTE="ouslgdrive"
REMOTE_FOLDER="Fedora Backup"
LOG_FILE="$HOME/logs/rclone-backup.log"

# Ensure log directory exists
mkdir -p "$(dirname "$LOG_FILE")"

echo "-------------------------------------" >> "$LOG_FILE"
echo "Backup started at $(date)" >> "$LOG_FILE"

# -P: Shows real-time speed, percentage, and file names
# --update: Skips files that are already on Drive (unless local version is newer)
# tee -a: Displays output in terminal AND saves to log file
/usr/bin/rclone copy "$LOCAL_FOLDER" "$REMOTE_REMOTE:$REMOTE_FOLDER" \
    --create-empty-src-dirs \
    --update \
    -P \
    --verbose \
    2>&1 | tee -a "$LOG_FILE"

echo "Backup finished at $(date)" >> "$LOG_FILE" 
```

- Make it executable:

```Bash
chmod +x ~/scripts/backup_to_gdrive.sh
```
3. Setup the gcopy Alias (Manual Trigger)
To run this backup manually with the command `gcopy`:

Open your bash config: 

```nvim ~/.bashrc
```

Add this line at the bottom:

```Bash
alias gcopy='/home/asitha/scripts/backup_to_gdrive.sh'
```

Apply changes: source ~/.bashrc

4. Automation (systemd Timer)
On Arch, systemd timers are preferred over Cron for better reliability and logging.

Create the Service file: nvim ~/.config/systemd/user/rclone-backup.service

```bash
Ini, TOML
[Unit]
Description=Scheduled Rclone Backup

[Service]
ExecStart=/home/asitha/scripts/backup_to_gdrive.sh
Create the Timer file: nvim ~/.config/systemd/user/rclone-backup.timer
```
```bash
Ini, TOML
[Unit]
Description=Run Rclone Backup 3 times daily

[Timer]
OnCalendar=*-*-* 07,13,19:00:00
Persistent=true

[Install]
WantedBy=timers.target
Enable the timer:

```
```Bash
systemctl --user daemon-reload
systemctl --user enable --now rclone-backup.timer
```

5. Verification & Safety Checks
Verify Remote Folder: Run rclone lsd ouslgdrive: to ensure "Fedora Backup" appears exactly as written.

Check Scheduled Runs: Run systemctl --user list-timers to see when the next backup is scheduled.

Safe Deletion: Because the script uses copy instead of sync, deleting /mnt/Files/Backup/photo.jpg locally will not delete it from Google Drive.

Efficiency: Rclone compares file sizes and hashes. If a file hasn't changed, it won't be re-uploaded, saving your data and time.
