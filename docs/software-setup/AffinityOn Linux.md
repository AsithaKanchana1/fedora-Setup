# How to Use Affinity Suite on Fedora Linux

**Documentation Reference**: [seapear/Affinity On Linux](https://github.com/seapear/AffinityOnLinux/tree/main)

## Prerequisites

### Required Software

1. **Lutris**
   ```bash
   sudo dnf install lutris
   ```

2. **Winetricks**
   ```bash
   sudo dnf install winetricks
   ```

## Important Pre-Installation Steps

### 1. Initialize Lutris

Before copying the elementary Wine files, you need to:
- Open the newly installed Lutris application
- This will download all dependencies and set up the file structure

### 2. ElementalWarrior-x86_64 File Location

Since we're using `dnf install lutris`, place the extracted files in:
```bash
/home/asitha/.local/share/lutris/runners/wine
```

**Note**: Replace `asitha` with your username.

### 3. Wine Folder Not Found

Sometimes Lutris doesn't create the wine folder automatically. In this case:
- Manually create a `wine` folder inside `runners/`
- Add the extracted folder to the newly created wine directory 

## Important Fixes

### ⚠️ Common Installation Issues

#### Issue: Stuck at WinMetadata.zip Download Step

The original documentation includes an `Affinity-ew.yaml` file, but the installation gets stuck on the `winmetadata` download step.

**Solution:**

1. **Download WinMetadata manually**
   - [**WinMetadata.zip**](https://archive.org/download/win-metadata/WinMetadata.zip)

2. **Use the edited YAML file**
   - Download the modified [**Affinity-ew.yaml**](assets/Files/Affinity on linux/Affinity-ew/)

3. **Complete the remaining steps** as documented

## Post-Installation Configuration

After installation, you need to configure Lutris settings to make the app usable:

### 1. Change Identifier

- Right-click on Affinity in Lutris → **Config**
- Change identifier from `affinity-suite` to `affinity-canva`

### 2. Add WinMetadata

1. Extract the WinMetadata.zip file
2. Cut the extracted folder
3. In Lutris, right-click → **Browse**
4. Navigate to: `drive_c` → `windows` → `system32`
5. Paste the extracted folder here
6. Done!

### 3. Configure Executable

1. In Lutris, right-click → **Config** → **Game Options**
2. Click on the executable field → Click the **three dots** (Browse)
3. Navigate to: `drive_c` → `Program Files` → `Affinity` → `Affinity` → `Affinity.exe`
4. Select the executable

### 4. Create Application Shortcut

You can create a desktop shortcut for easier access.

## Additional Resources

**Video Tutorial**: [Affinity Install Guide](https://youtu.be/6jGYPTKfcuw?si=bWtFfu--kz-UkoQd)
