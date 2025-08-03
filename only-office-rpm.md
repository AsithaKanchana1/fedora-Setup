

<!-- toc -->

- [Only Office Install](#only-office-install)
    + [System - Fedora 42](#system---fedora-42)
    + [Using the vendor’s native RPM repository](#using-the-vendors-native-rpm-repository)
  * [Add The ONLYOFFICE REPO](#add-the-onlyoffice--repo)
  * [Install the Editors](#install-the-editors)
  * [Launch and Verify](#launch-and-verify)
- [How to Update](#how-to-update)
  * [How to Remove ONLYOFFICE](#how-to-remove-onlyoffice)

<!-- tocstop -->

# Only Office Install 
### System - Fedora 42
###  Using the vendor’s native RPM repository 

## Add The ONLYOFFICE  REPO
```bash
sudo dnf install -y \
  https://download.onlyoffice.com/repo/centos/main/noarch/onlyoffice-repo.noarch.rpm
```

- Although the URL mentions centos, the repository metadata is architecture-neutral and works on any recent RHEL/Fedora family distro.

## Install the Editors
```bash
sudo dnf install -y onlyoffice-desktopeditors
```


## Launch and Verify
```bash
desktopeditors &
```

# How to Update 
Since we installed Vendors Virsion it will update with system updates 

## How to Remove ONLYOFFICE

```bash
sudo dnf remove onlyoffice-desktopeditors
sudo dnf remove onlyoffice-repo
```

