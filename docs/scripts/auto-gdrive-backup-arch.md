
<!-- toc -->

- [Arch – Automated Google Drive Backup Setup (Safe Copy Mode)](#arch--automated-google-drive-backup-setup-safe-copy-mode)

<!-- tocstop -->

# Arch – Automated Google Drive Backup Setup (Safe Copy Mode)
This guide explains how to set up rclone on Arch-based systems (e.g. Omarchy, Manjaro, EndeavourOS) to automatically back up files from /mnt/Files/Backup to a Google Drive folder named Fedora Backup, running three times daily (07:00 AM, 1:00 PM, 7:00 PM) without deleting files from Drive when deleted locally.

1. Install rclone
```bash
sudo pacman -S rclone
```
2. Configure Google Drive Remote in rclone
- Run the configuration tool
```bash
rclone config
```
- Follow these prompts:
  - New remote

```text
n
```
  - Name
Example:
```text
ouslgdrive
```
  - Storage type
Enter:
```text
drive
```
this is for (Google Drive)

  - Client ID
Press Enter to use the default (or create your own for higher quotas).

  - Scope
Enter:
```text
1
```
for Full access

  - Service account file
Press Enter to leave blank.

  - Edit advanced config?
```text
n
```
  - Use web browser to authenticate?
```text
y
```
  - A browser opens → log in to your Google account.

  - Grant access → browser shows success.

  - Save remote
```text
y
```
  - Quit config tool
```text
q
```
3. Verify Remote
Test the connection
```bash
rclone ls ouslgdrive:
```
4. Find Google Drive Backup Folder
To ensure backups go into Fedora Backup folder:

- Open Google Drive → navigate to Fedora Backup folder.

Copy its Folder ID from the URL:
Example URL:

```text
https://drive.google.com/drive/folders/1A2B3C4D5E6F7G8H9I0J
```
  - Folder ID = 1A2B3C4D5E6F7G8H9I0J

5. Manual Backup Command (Safe Mode)
- **Important:** Use copy instead of sync to prevent deletion on Drive.

Example:
```bash
rclone copy /mnt/Files/Backup ouslgdrive:"Fedora Backup" --create-empty-src-dirs --verbose
```
OR, using folder ID:

```bash
rclone copy /mnt/Files/Backup ouslgdrive:"1A2B3C4D5E6F7G8H9I0J" --create-empty-src-dirs --verbose
```
6. Create a Backup Script
Store the backup command in a reusable script.
```bash
mkdir -p ~/scripts ~/logs
nano ~/scripts/backup_to_gdrive.sh
```
- Paste:

```bash
#!/bin/bash
# Backup /mnt/Files/Backup to Google Drive Fedora Backup folder
# Safe mode: local deletions do NOT remove remote files

LOCAL_FOLDER="/mnt/Files/Backup"
REMOTE_REMOTE="ouslgdrive"
REMOTE_FOLDER="Fedora Backup"  # Or use folder ID for accuracy
LOG_FILE="$HOME/logs/rclone-backup.log"

echo "-------------------------------------" >> "$LOG_FILE"
echo "Backup started at $(date)" >> "$LOG_FILE"

/usr/bin/rclone copy "$LOCAL_FOLDER" "$REMOTE_REMOTE:\"$REMOTE_FOLDER\"" --create-empty-src-dirs --verbose >> "$LOG_FILE" 2>&1

echo "Backup finished at $(date)" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
```
- Make it executable:
```bash
chmod +x ~/scripts/backup_to_gdrive.sh
```
- Test manually:

```bash
~/scripts/backup_to_gdrive.sh
```
- View log:
```bash
cat ~/logs/rclone-backup.log
```
7. Automate with Cron (Three Times a Day)
- Edit crontab:
```bash
crontab -e
```
- Add following line to it (7am,1pm,7pm):
```bash
0 7,13,19 * * * /home/asitha/scripts/backup_to_gdrive.sh
```
8. Useful Commands
- List remote folders:
```bash
rclone lsd ouslgdrive:
```
- List files in backup folder:
```bash
rclone ls ouslgdrive:"Fedora Backup"
```
- Restore from Drive:

```bash
rclone copy ouslgdrive:"Fedora Backup" /mnt/Files/Restore --verbose
```
9. Key Points
- Use rclone copy → Safe backup, no remote deletion.

- Cron job ensures 07:00 AM, 1:00 PM, 7:00 PM backups daily.

- Logs stored in `~/logs/rclone-backup.log`.

- On Arch-based systems, rclone is installed via `pacman`, not `dnf`.

Always verify folder path or use folder ID to avoid wrong destinations.
