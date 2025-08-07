

<!-- toc -->

- [Install the One Drive FUSE client (On Demand )](#install-the-one-drive-fuse-client-on-demand-)
  * [Why](#why)
  * [Reson FUSE client](#reson-fuse-client)
  * [way ro do that](#way-ro-do-that)
    + [Installation](#installation)
    + [add `Onedrive` account](#add-onedrive-account)
    + [Daily usage & update cadence](#daily-usage--update-cadence)

<!-- tocstop -->

# Install the One Drive FUSE client (On Demand )

## Why 
Most of the us sometimes need to use one drive as file shering option for in my case i am using MS office web suite so it is easy for me to save files to onedrive and access them with another divice thats the reson 

## Reson FUSE client

since i am using university given microsoft account i cannot add it in gnome online accounts it requires admin access of the account unfotunatly i dont have it (University has ) and also i dont need to sync every things to my pc every time i need simple file showing and uploading macanisum so when ineed to download some file to my pc i can opy them or when i need to upload someting it will sync thats all 

## way ro do that 

### Installation

- Enable the COPR repo (this is onetime thing)

```bash
sudo dnf copr enable jstaf/onedriver
```

- install `one drive`
```bash
sudo dnf install onedriver
```

### add `Onedrive` account 
- Launch the GUI 
```bash
onedriver-gui &
```
- Click the ＋ button → choose or create a mount folder
   - Good desktop path: `~/Cloud/OneDrive`

   - Want it to appear under Devices?
   ***Use /mnt/onedrive*** 
   **(create it first with `sudo mkdir -p /mnt/onedrive`).**
   
- Sign in through the Microsoft pop-up.

- Verify the toggle shows Mounted—the folder is now live.

- Make the mount easy to reach in Nautilus
- If the path is in your home directory: press Ctrl +D while inside the folder to add a sidebar bookmark.

- If you mounted under /mnt or /media, Nautilus auto-lists it under Devices with an eject icon.

- Auto-mount at every login (optional but recommended)
   - In OneDriver-GUI, enable Auto-mount on login for the account.
   - This creates `~/.config/systemd/user/onedriver@<account>.service`, which systemd starts after you log in.

### Daily usage & update cadence
- Streaming model – nothing downloads until you open or copy a file; uploads start the moment you drop a file into the mount.

- Cache lifetime – opened files stay in a local cache. Clear it in the GUI if you’re low on space.

- Cloud changes – OneDriver polls for remote updates roughly every 30 s by default. If you add/rename files on another device, they will appear in the mounted folder within half a minute

- force a refresh anytime with:
```bash
onedriver --refresh
```
- Status check – view sync queues, cache size, or errors:
```bash
onedriver --status
```

Doc date : 2025-08-07

