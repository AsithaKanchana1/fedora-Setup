# Fedora My Theams 
This Project is for My Personal Use But If Some one can get Help from it all of you are welcome 

## Usefull Links 
- [Cris Titus Tech Linux Utility](https://github.com/ChrisTitusTech/linutil.git)
- [Video](https://youtu.be/viffvWtMTdo)

- [Git Credential Manager](/git-credential-manager.md)

## Dependencies 
- Codec Install 

```bash 
sudo dnf install libavcodec-freeworld
```

## Extentions 
- Extention Manager (By Mattive Jakman [Blue icon])
- Tiling Shell (Tiling Assitent - Windows Like)
- Blur My Shell ( Blure Background )
- Dash to Dock (Mac Like Dock)
    - Dash To Dock animated (animated Mack Dock)
- Dash to task bar (Windows Like )
- App icon Taskbar [Not shure what is purpus]
- Clipboard indicator (clip board manager)
- Gnome Fuzzy App Search (Fuzzy Search )
- Quick Settings Tweeks [Not shure]
- Tiling shell (advanced tiling window manager ,win 11 snap assitent ,Fanzy zone , Automatic tilting,etc)
- Window lits (add window list to bottom of the page )[not my fav]
- User Theam
- Custom accesnt Color 
    - [Dependencese - User Theam Extention]
- Appindicator and KSstatusNotifireiterm Support
- vitals
- Open Bar (Top Bar Custermization)
    - [Download Them File](/config/openbar)


[Extention website](https://extensions.gnome.org/extension/7065/tiling-shell/)

## Theam Pack 

- Go to Home Derectory and Past  `.themes` folder and `.icons` folder 
- install Gnome Tweeks app

```bash
sudo dnf install gnome-tweaks 
```

Change Theams in GNOME Tweeks app 

- Appearance --> Icons 
- Appearance --> Legasy Applications

# After CTT Linux Utility Installation 

- Install Alacrity  
- 
## Softwares 
- Need to install Following Dependencies

- Enable RPM Fusion 
```bash
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

- Brave Browser Repo
```bash
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
```
- Microsoft Edge Repo
```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
```
- Github Desktop Repo
```bash
sudo rpm --import https://rpm.packages.shiftkey.dev/gpg.key
sudo sh -c 'echo -e "[shiftkey-packages]\nname=GitHub Desktop\nbaseurl=https://rpm.packages.shiftkey.dev/rpm/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://rpm.packages.shiftkey.dev/gpg.key" > /etc/yum.repos.d/shiftkey-packages.repo'
```

- EduVPN Repo
```bash 
curl -O https://app.eduvpn.org/linux/v4/rpm/app+linux@eduvpn.org.asc
sudo rpm --import app+linux@eduvpn.org.asc
cat << 'EOF' | sudo tee /etc/yum.repos.d/python-eduvpn-client_v4.repo
[python-eduvpn-client_v4]
name=eduVPN for Linux 4.x (Fedora $releasever)
baseurl=https://app.eduvpn.org/linux/v4/rpm/fedora-$releasever-$basearch
gpgcheck=1
EOF
```
- FlareGet Download Manager
```bash
wget https://dl.flareget.com/downloads/files/flareget/rpm/amd64/flareget-5.0-0.x86_64.rpm
sudo dnf install ./flareget-5.0-0.x86_64.rpm
```

- Install following apps in one command
    - smplayer
    - vlc
    - brave browser
    - microsoft edge
    - obs
    -eduvpn
    - firefox
    - vs code
    - github desktop
```bash
sudo dnf install -y smplayer vlc brave-browser microsoft-edge-stable obs-studio eduvpn-client firefox code github-desktop
```
### Complex Installations 
- [mySql WorkBench](/mysql-work-bench.md)

- [Android studio](/android-studio-setup.md)

- [Davinchi Resolve](/davinci-resolve-install.md) 
# Alacrity 
## Config file
i have added current alacrity config files to 
- [Alacrity file](/config/alacrity)

to add those follow instructions
change `asitha` to your user name 
- Add folowing files to `/home/asitha/.config/alacritty` 
    - alacrity.toml
- Give permissions to the file 
```bash
chown $USER:$USER ~/.config/alacritty/*
```

## Open Alacrity in File Manager 
### To Set Alacrity as default Teminal in File manager 

Install Extention For GNOME

```bash
sudo dnf copr enable monkeygold/nautilus-open-any-terminal
sudo dnf install nautilus-open-any-terminal

```

Set Alacrity as Your Terminal

```bash 
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty
```

Restart Nautilus to apply the changes

```bash
nautilus -q
```

### To Set Tabs Like Option on Teminal

Lets Use tmux 
- Installation (fedora)
```bash 
sudo dnf install tmux
```
- Verification
```bash
tmux -V
```
- To Set Open `tmux` every time Alacrity Open Edit `/home/asitha/.config/alacritty/alacritty.toml` file and 
add following Line to bottom of the page 

```bash
[terminal.shell]
program = "tmux"
```
#### `tmux` Usage 

tmux "Tabs" (Windows)

- New tab: `Ctrl+b, then c`

- Next tab: `Ctrl+b, then n`

- Prev tab: `Ctrl+b, then p`

- List tabs: `Ctrl+b, then w`

### Enable Auto Sudjetions 

There are two Option 
- zsh
- bash (ble.sh) ---- Currently Using

#### ble.sh installation
```bash
curl -L https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz | tar xJf -
bash ble-nightly/ble.sh --install ~/.local/share
echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc

```
Optional 
Restart bash terminal
```bash
source ~/.bashrc
```

#### zhs installation
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

Add to your .zshrc 
```bash 
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
```

