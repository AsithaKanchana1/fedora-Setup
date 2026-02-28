#!/bin/bash

# --- CONFIGURATION ---
SCRIPT_DIR="$HOME/scripts"
LOG_DIR="$HOME/logs"
BACKUP_SCRIPT="$SCRIPT_DIR/backup_to_gdrive.sh"
SERVICE_NAME="rclone-backup"
SYSTEMD_USER_DIR="$HOME/.config/systemd/user"

echo "🚀 Starting Rclone Backup Setup..."

# 1. Create necessary directories
mkdir -p "$SCRIPT_DIR" "$LOG_DIR" "$SYSTEMD_USER_DIR"

# 2. Create the actual backup script
echo "📝 Creating backup script at $BACKUP_SCRIPT"
cat << 'EOF' > "$BACKUP_SCRIPT"
#!/bin/bash
LOCAL_FOLDER="/mnt/Files/Backup"
REMOTE_REMOTE="ouslgdrive"
REMOTE_FOLDER="Fedora Backup"
LOG_FILE="$HOME/logs/rclone-backup.log"

mkdir -p "$(dirname "$LOG_FILE")"

echo "-------------------------------------" >> "$LOG_FILE"
echo "Backup started at $(date)" >> "$LOG_FILE"

/usr/bin/rclone copy "$LOCAL_FOLDER" "$REMOTE_REMOTE:$REMOTE_FOLDER" \
    --create-empty-src-dirs \
    --update \
    -P \
    --verbose \
    2>&1 | tee -a "$LOG_FILE"

echo "Backup finished at $(date)" >> "$LOG_FILE"
EOF

chmod +x "$BACKUP_SCRIPT"

# 3. Setup the gcopy alias in .bashrc
if ! grep -q "alias gcopy=" "$HOME/.bashrc"; then
    echo "🔗 Adding 'gcopy' alias to .bashrc"
    echo "alias gcopy='$BACKUP_SCRIPT'" >> "$HOME/.bashrc"
else
    echo "✅ Alias 'gcopy' already exists."
fi

# 4. Create systemd Service file
echo "⚙️ Setting up systemd service..."
cat << EOF > "$SYSTEMD_USER_DIR/$SERVICE_NAME.service"
[Unit]
Description=Scheduled Rclone Backup for Asitha

[Service]
ExecStart=$BACKUP_SCRIPT
EOF

# 5. Create systemd Timer file (7am, 1pm, 7pm)
echo "⏰ Setting up systemd timer..."
cat << EOF > "$SYSTEMD_USER_DIR/$SERVICE_NAME.timer"
[Unit]
Description=Run Rclone Backup 3 times daily

[Timer]
OnCalendar=*-*-* 07,13,19:00:00
Persistent=true

[Install]
WantedBy=timers.target
EOF

# 6. Enable and Start the timer
echo "🔄 Reloading systemd and enabling timer..."
systemctl --user daemon-reload
systemctl --user enable --now "$SERVICE_NAME.timer"

echo "✅ Setup Complete!"
echo "👉 Run 'source ~/.bashrc' to enable the 'gcopy' command now."
echo "👉 Run 'systemctl --user list-timers' to verify the schedule."
