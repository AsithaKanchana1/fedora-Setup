# Fedora My Theams 

[text](https://youtu.be/AE1-W2bMVEs)

[text](https://youtu.be/viffvWtMTdo)
## Dependencies 
- Codec Install 

```bash 
sudo dnf install libavcodec-freeworld
```

## Extentions 
- Tiling Shell (Tiling Assitent - Windows Like)

[Text](https://extensions.gnome.org/extension/7065/tiling-shell/)

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
git clone https://github.com/akinomyoga/ble.sh.git ~/.local/share/blesh
echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc
```
Restart Terminal and it will apply


#### zhs installation
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

Add to your .zshrc 
```bash 
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
```

