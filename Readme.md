# Fedora My Theams 

[text](https://youtu.be/AE1-W2bMVEs)

[text](https://youtu.be/viffvWtMTdo)

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

