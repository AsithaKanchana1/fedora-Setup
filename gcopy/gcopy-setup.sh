#!/bin/bash

# --- setup-sync.sh ---
# An interactive setup "app" to create:
# 1. A manual rclone sync alias.
# 2. An automatic rclone sync service using systemd.

# Define some colors for the UI
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Welcome to the Auto-Sync Setup App!${NC}"
echo "This script will help you set up both a manual alias and an"
echo "automatic background service for syncing with rclone."
echo "--------------------------------------------------------"

# --- Step 1: Check for rclone ---
echo -e "${BLUE}[1/8] Checking for rclone...${NC}"
if ! command -v rclone &> /dev/null; then
    echo -e "${YELLOW}rclone is not installed.${NC}"
    read -p "May I install it now? (sudo dnf install rclone) [y/N]: " install_rclone
    if [[ "$install_rclone" =~ ^[yY](es)?$ ]]; then
        sudo dnf install rclone
        if ! command -v rclone &> /dev/null; then
            echo -e "${RED}ERROR: rclone installation failed. Please install it manually.${NC}"
            exit 1
        fi
    else
        echo "rclone is required. Exiting."
        exit 1
    fi
else
    echo "rclone is already installed."
fi

# --- Step 2: Configure rclone (The "API" part) ---
echo -e "\n${BLUE}[2/8] Configuring rclone Remote${NC}"
echo "We need to make sure rclone is configured to access your Google Drive."
rclone listremotes
echo -e "${YELLOW}The list above shows your currently configured remotes.${NC}"
read -p "Do you need to add or update your Google Drive remote? [y/N]: " config_rclone
if [[ "$config_rclone" =~ ^[yY](es)?$ ]]; then
    echo "Please follow the interactive prompts from rclone to configure your remote."
    echo "When it asks for a name, remember what you call it (e.g., 'ouslgdrive')."
    rclone config
fi

echo -e "\nLet's verify the remote name."
rclone listremotes
read -p "Enter the name of the rclone remote to use (e.g., ouslgdrive): " RCLONE_REMOTE
# Remove trailing colon if user added one
RCLONE_REMOTE=${RCLONE_REMOTE%:}
if [ -z "$RCLONE_REMOTE" ]; then
    echo -e "${RED}Remote name cannot be empty. Exiting.${NC}"
    exit 1
fi

# --- Step 3: Get Service/Alias Name (The User's Choice) ---
echo -e "\n${BLUE}[3/8] Set Command Name${NC}"
echo "What would you like to call this sync command?"
echo "This will be used for both the alias and the service name (e.g., 'gcopy', 'drivebackup')."

SERVICE_NAME=""
while true; do
    read -p "Enter your desired command name: " SERVICE_NAME
    if [ -z "$SERVICE_NAME" ]; then
        echo -e "${RED}Name cannot be empty. Please try again.${NC}"
    elif command -v "$SERVICE_NAME" &> /dev/null; then
        echo -e "${YELLOW}Warning: '$SERVICE_NAME' is already an existing command.${NC}"
        read -p "Are you sure you want to overwrite it? [y/N]: " overwrite_cmd
        if [[ "$overwrite_cmd" =~ ^[yY](es)?$ ]]; then
            break
        fi
    else
        # This is a good, free name
        break
    fi
done
echo -e "${GREEN}Using '${SERVICE_NAME}' as the name.${NC}"

# --- Step 4: Get Paths (The "Drive Locations") ---
echo -e "\n${BLUE}[4/8] Setting Paths${NC}"
echo "Please provide the FULL source and destination paths."
echo "Example Source (your PC): /mnt/Files/Backup"
echo "Example Destination (Google Drive): Fedora Backup"

read -p "Enter the FULL local source path: " SOURCE_PATH
read -p "Enter the Google Drive destination folder name/path: " DEST_PATH

if [ -z "$SOURCE_PATH" ] || [ -z "$DEST_PATH" ]; then
    echo -e "${RED}Source and Destination paths are required. Exiting.${NC}"
    exit 1
fi

# --- Step 5: Choose Setup Type ---
echo -e "\n${BLUE}[5/8] Choose Setup Type${NC}"
read -p "Set up a MANUAL alias for '$SERVICE_NAME'? [Y/n]: " SETUP_ALIAS
read -p "Set up an AUTOMATIC background sync? [Y/n]: " SETUP_TIMER

# --- Step 6: Get Schedule (The "Times") ---
SYNC_MINUTES="30"
if [[ ! "$SETUP_TIMER" =~ ^[nN](o)?$ ]]; then
    echo -e "\n${BLUE}[6/8] Setting Schedule${NC}"
    read -p "How often (in minutes) do you want the automatic sync to run? [30]: " SYNC_MINUTES
    # Default to 30 if empty
    SYNC_MINUTES=${SYNC_MINUTES:-30}
fi

# --- Step 7: Confirmation ---
# Build the full rclone command
RCLONE_CMD="/usr/bin/rclone copy \"${SOURCE_PATH}\" \"${RCLONE_REMOTE}:${DEST_PATH}\" --create-empty-src-dirs --verbose"

echo "----------------------------------------------------"
echo -e "${GREEN}Configuration Summary:${NC}"
echo "  - Command Name:    ${SERVICE_NAME}"
echo "  - Rclone Remote:   ${RCLONE_REMOTE}"
echo "  - Local Source:    ${SOURCE_PATH}"
echo "  - Drive Dest:      ${DEST_PATH}"
echo ""
if [[ ! "$SETUP_ALIAS" =~ ^[nN](o)?$ ]]; then
    echo -e "  - ${GREEN}Manual Alias:${NC}  Will be created."
    echo "    (Command: alias ${SERVICE_NAME}='${RCLONE_CMD}')"
else
    echo -e "  - ${RED}Manual Alias:${NC}  Will NOT be created."
fi
if [[ ! "$SETUP_TIMER" =~ ^[nN](o)?$ ]]; then
    echo -e "  - ${GREEN}Auto-Sync:${NC}     Will be created (every ${SYNC_MINUTES} mins)."
else
    echo -e "  - ${RED}Auto-Sync:${NC}     Will NOT be created."
fi
echo "----------------------------------------------------"
read -p "Does this look correct? [y/N]: " confirm
if [[ ! "$confirm" =~ ^[yY](es)?$ ]]; then
    echo "Setup cancelled."
    exit 0
fi

# --- Step 8: Execute Setup ---
echo -e "\n${BLUE}[8/8] Executing setup...${NC}"

# Setup the manual alias
if [[ ! "$SETUP_ALIAS" =~ ^[nN](o)?$ ]]; then
    echo "Adding alias to shell configuration files..."
    ALIAS_LINE="alias ${SERVICE_NAME}='${RCLONE_CMD}'"
    
    # Add to .bashrc
    if [ -f "$HOME/.bashrc" ]; then
        echo -e "\n# Custom sync alias" >> "$HOME/.bashrc"
        echo "$ALIAS_LINE" >> "$HOME/.bashrc"
        echo "Added to ~/.bashrc"
    fi
    
    # Add to .zshrc if it exists (for zsh users)
    if [ -f "$HOME/.zshrc" ]; then
        echo -e "\n# Custom sync alias" >> "$HOME/.zshrc"
        echo "$ALIAS_LINE" >> "$HOME/.zshrc"
        echo "Added to ~/.zshrc"
    fi
    echo -e "${YELLOW}Please run 'source ~/.bashrc' or 'source ~/.zshrc' (or restart your terminal) to use the new alias.${NC}"
fi

# Setup the automatic timer
if [[ ! "$SETUP_TIMER" =~ ^[nN](o)?$ ]]; then
    echo "Creating systemd user files..."
    SERVICE_DIR="$HOME/.config/systemd/user"
    SERVICE_FILE="$SERVICE_DIR/${SERVICE_NAME}.service"
    TIMER_FILE="$SERVICE_DIR/${SERVICE_NAME}.timer"
    
    # Create the directory if it doesn't exist
    mkdir -p "$SERVICE_DIR"

    # Create the .service file
    echo "Creating $SERVICE_FILE..."
    cat > "$SERVICE_FILE" << EOF
[Unit]
Description=Rclone sync service for ${SERVICE_NAME}
Wants=network-online.target
After=network-online.target

[Service]
Type=oneshot
ExecStart=${RCLONE_CMD}
EOF

    # Create the .timer file
    echo "Creating $TIMER_FILE..."
    cat > "$TIMER_FILE" << EOF
[Unit]
Description=Run ${SERVICE_NAME}.service every ${SYNC_MINUTES} minutes

[Timer]
OnCalendar=*:0/${SYNC_MINUTES}
Persistent=true

[Install]
WantedBy=timers.target
EOF

    # Enable and Start the new timer
    echo "Reloading systemd user daemon..."
    systemctl --user daemon-reload
    
    echo "Enabling and starting the timer..."
    systemctl --user enable --now "${SERVICE_NAME}.timer"
fi

echo -e "\n${GREEN}All done!${NC}"
if [[ ! "$SETUP_TIMER" =~ ^[nN](o)?$ ]]; then
    echo "Your automatic backup is now active."
    echo "You can check its status anytime with:"
    echo -e "${YELLOW}systemctl --user list-timers${NC}"
fi
