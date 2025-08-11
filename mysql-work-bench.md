

<!-- toc -->

- [How to Install MySQL Workbench on Fedora Using Snap and Create a Desktop/App Launcher Icon](#how-to-install-mysql-workbench-on-fedora-using-snap-and-create-a-desktopapp-launcher-icon)
  * [Before Installation](#before-installation)
  * [Unsupported OS Warning?](#unsupported-os-warning)
    + [Uninstalling](#uninstalling)

<!-- tocstop -->

# How to Install MySQL Workbench on Fedora Using Snap and Create a Desktop/App Launcher Icon
This guide explains how to install MySQL Workbench via Snap on Fedora,
and how to create both a desktop shortcut and an application menu icon for quick launching.
This is suitable for students, developers, or anyone wanting reliable access to MySQL Workbench.

## Before Installation
- Used 
	- Fedora Version - **Fedora Workstartion 42**
	- snap
Since fedora offitialy doesent support My Sql Workbench (There is no `flatpack` and `rpm` Version is not working)

1. Install Snapd (Snap Package Manager)
Open your terminal and run
```bash
sudo dnf upgrade --refresh
sudo dnf install snapd fuse squashfuse kernel-modules -y

```
Enable the Snapd socket and restart for good measure:

```bash
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo reboot

```

2. **Install MySQL Workbench via Snap**
Install using the Snap package:

```bash
sudo snap install mysql-workbench-community
```
Allow it to finish downloading and installing.

3. Launch MySQL Workbench from Terminal (First Time)
To ensure it works, launch the application:

```bash
snap run mysql-workbench-community
```
You might see a warning about "`unsupported operating system`"—this is normal on Fedora and can be ignored for standard use.

## If Desktop Shortcut is not created Then Follow Bellow Steps

4. Create a Desktop Shortcut and Menu Icon
Option 1: 
- Use Snap’s Provided .desktop Launcher
Find the .desktop file:

```bash
ls /var/lib/snapd/desktop/applications/ | grep mysql-workbench
```
You should see:
`mysql-workbench-community_mysql-workbench-community.desktop`

Copy `.desktop` file to Applications and/or Desktop:

- To add to user applications menu:

```bash
cp /var/lib/snapd/desktop/applications/mysql-workbench-community_mysql-workbench-community.desktop ~/.local/share/applications/
```
- To add shortcut to your desktop:

```bash
cp /var/lib/snapd/desktop/applications/mysql-workbench-community_mysql-workbench-community.desktop ~/Desktop/
chmod +x ~/Desktop/mysql-workbench-community_mysql-workbench-community.desktop
```
- Allow Launching (if prompted):

On your desktop, right-click the new icon and select “Allow Launching.”

Now the launcher will appear in your desktop environment’s app grid/menu and you have a direct desktop shortcut.

## Unsupported OS Warning?
This is expected on Fedora; all major features typically work as normal.

### Uninstalling
Remove MySQL Workbench if needed:

```bash
sudo snap remove mysql-workbench-community
```
Optionally remove Snap:

```bash
sudo dnf remove snapd
```


