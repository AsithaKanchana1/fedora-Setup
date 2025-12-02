# How to Install Postman on Linux Using System Binaries

There are multiple ways to install Postman on a Linux system:

| Method | Description |
|--------|-------------|
| Software Center | Install via your distro's app store |
| Flatpak | Install using Flatpak package manager |
| System Binaries | Manual installation (this guide) |

### Quick Flatpak Installation
```bash
flatpak install flathub com.getpostman.Postman
```

---

This guide covers the **manual installation using system binaries**, which gives you more control over the installation.

## Requirements

- Linux OS (Fedora, Ubuntu, etc.)
- Internet connection
- Text editor (nano, vim, etc.)
- `sudo` privileges

---

## Installation Steps

### Step 1: Download Postman

1. Go to the official Postman website: [Download Postman](https://www.postman.com/downloads/)
2. Download the **Linux x64** version (`.tar.gz` file)

### Step 2: Extract the Archive

Navigate to your Downloads folder and extract the file:

```bash
cd ~/Downloads
tar -xzf postman-linux-x64.tar.gz
```

### Step 3: Move to `/opt` Directory

Move the extracted folder to `/opt` for system-wide access:

```bash
sudo mv Postman /opt/
```

> **Note**: The `/opt` directory is used for optional/add-on software packages.

### Step 4: Create Symbolic Link

Create a symbolic link so you can run Postman from anywhere using the `postman` command:

```bash
sudo ln -s /opt/Postman/Postman /usr/bin/postman
```

---

## Create Desktop Shortcut

To add Postman to your application menu/launcher:

### Step 1: Create Desktop Entry File

```bash
nano ~/.local/share/applications/postman.desktop
```

### Step 2: Add the Following Content

```ini
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Comment=API Development Environment
Exec=/opt/Postman/Postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
```

### Step 3: Save and Exit

- Press `Ctrl` + `O` to save
- Press `Enter` to confirm
- Press `Ctrl` + `X` to exit

---

## Verification

You can now launch Postman using:

- **Terminal**: Type `postman` and press Enter
- **Application Menu**: Search for "Postman" in your app drawer/launcher

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Command not found | Verify the symbolic link exists: `ls -la /usr/bin/postman` |
| Icon not showing | Log out and log back in, or restart your desktop environment |
| Permission denied | Ensure you used `sudo` for moving files and creating the symlink |

---

*Created by: Asitha Kanchana Palliyaguru*