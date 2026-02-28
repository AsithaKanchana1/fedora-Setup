# Kitty Setup On Fedora 
## Tested System 

- Fedora 43 (GNOME)
- Dell Inspiron 15 3000 Laptop 
- 12GB RAM 
- I3 11GEN Prosessor

## Steps 
### Overview 
a minimalist ,GPU-accelarated terminal setup disighnfor software development 
Reson to move to `Kitty` beside `Alacrity` is that kitty dont need terminal session manager like `tmux` to get sessions also there are gpu acceslaration support and image viwing ability is the main focus for now but there are more defferences in  kitty vs Alacrity 

### Feateures
- No mouse navigations : use `zoxide` for jumping folders and `fzf` for file searching
- VS Code Style Shortcuts : Ctrl+C for copy and Ctrl + V for Paste and zooming and zoom out features 
- Presiston sessions : Configure for Hight speed SSH Connectiosn with automatic enviroment syncing 

## Installation Steps 
#### Installation for Kitty
```bash
sudo dnf install kitty -y 
```

#### Install Tools 

```bash
sudo dnf install fzf zoxide -y 
```

#### syncing Configs 
Download Config files From Github Repo 
`fedora-setup/assets/files/kitty-configs` 
open files and move them to `~/.config/kitty/ ` folder 


> importent 
since i am using `CTT Linux Utility` for terminal theam befor doing all of these i need to do it and then we can change other things like these 

## Kitty Issues 

some times kitty will flicker white the reson is that intel integrated graphics change to power saving mode when nothing moving on display and since kitty use gpu compere to Alacrity it will flicker white on kitty terminal this is result of intels feature called `Pannel Self-Refresh (PSR)` to fix this 

```bash
sudo grubby --update-kernel=ALL --args="i915.enable_psr=0"

```


