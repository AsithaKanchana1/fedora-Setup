<!--toc-->

# Alacrity Setup
## Config file
I have added current alacrity config files to the repository.

**Prerequisites**: Make sure you have cloned this repository first:
```bash
git clone https://github.com/AsithaKanchana1/fedora-Setup.git
cd fedora-Setup
```

To add those follow instructions:
- [Alacrity file](/config/alacrity)

Change `asitha` to your user name 
- Add following files to `/home/asitha/.config/alacritty` 
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

