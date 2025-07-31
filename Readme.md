# Fedora My Theams 


[text](https://youtu.be/viffvWtMTdo)

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
## Softwares 
- Edge (Good For Ms Online Apps ,PDF Reader)
```bash
flatpak install flathub com.microsoft.Edge
```
- vlc 
```bash 
flatpak install flathub org.videolan.VLC
```
- [mySql WorkBench](/mysql-work-bench.md)
I have created another markdown for this 

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

