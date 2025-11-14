

<!-- toc -->

- [How to Change VM File save Location on Gnome Boxes](#how-to-change-vm-file-save-location-on-gnome-boxes)
  * [Reson](#reson)
  * [Process](#process)

<!-- tocstop -->

# How to Change VM File save Location on Gnome Boxes

## Reson 
- There is no Graphical way to do this in Gnome Boxes by Defoult it saves all VMs in to `~/.local/share/gnome-boxes/`

- You can Change this By Moving File Location to New location or setting System simbolic link 

## Process

1. Ensure New Target Directory Exists
```bash
mkdir -p /mnt/Files/VMs
```
Mount your drive if necessary (for /mnt/Files). Make sure you have write permissions for your user.

2. Move Existing VMs (Optional)
If you already have VMs, move the storage directory:

For system package install:

```bash
mv ~/.local/share/gnome-boxes /mnt/Files/VMs
```
For Flatpak install:
```bash
mv ~/.var/app/org.gnome.Boxes/data/gnome-boxes /mnt/Files/VMs
```
3. Create a Symbolic Link
For system package install:
```bash
ln -s /mnt/Files/VMs/gnome-boxes ~/.local/share/gnome-boxes
```
For Flatpak install:

```bash
ln -s /mnt/Files/VMs/gnome-boxes ~/.var/app/org.gnome.Boxes/data/gnome-boxes
```
4. Verify
Open Boxes and start/create a new VM. The files will be stored in `/mnt/Files/VMs/gnome-boxes/` instead of your home partition.



