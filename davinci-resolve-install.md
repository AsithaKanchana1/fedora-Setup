

<!-- toc -->

- [Davinchi Resolve 20 Installation](#davinchi-resolve-20-installation)
  * [Tested Setup](#tested-setup)
  * [Requirements](#requirements)
  * [Installation](#installation)
  * [Fixing `zlib` issue](#fixing-zlib-issue)
    + [Reson for this issue](#reson-for-this-issue)
  * [Davinchi resolve is not Opening Issue](#davinchi-resolve-is-not-opening-issue)
      - [Next](#next)
    + [Fixing the DaVinci Resolve Desktop Launcher icon missing (.desktop file)](#fixing-the-davinci-resolve-desktop-launcher-icon-missing-desktop-file)
  * [unsupported gpu processing mode](#unsupported-gpu-processing-mode)
    + [Step-by-Step Guide to Prepare Intel UHD GPU OpenCL for DaVinci Resolve on Fedora 42](#step-by-step-guide-to-prepare-intel-uhd-gpu-opencl-for-davinci-resolve-on-fedora-42)

<!-- tocstop -->

# Davinchi Resolve 20 Installation
Documented - 2025.07.24
## Tested Setup
- Fedora Workstation 42
- Intel I3 11 Gen
- Intel UHD Graphics
- 12 GB RAM 
## Requirements
- Davinchi Resolve Linux Installation Files 
[Download](https://www.blackmagicdesign.com/products/davinciresolve)
- 

## Installation 

1. extract zip file 
2. do the following steps
```bash
chmod +x ./DaVinci_Resolve_*.run
```
- change the file name `DaVinci_Resolve_20.0.1_Linux.run` to your one
```bash
sudo ./DaVinci_Resolve_20.0.1_Linux.run -i
```
## Fixing `zlib` issue 
this is commen issue for when istalling davinchi in fedora 40+ (Since we are using 42 it is applicable)
### Reson for this issue 
Since Davinchi resolve is buld on older version of `zlif` it dont recognized newer `zlib files` acctually we have `zlib`files alredy so what we can dow is to skip this eror for that ,
- Change File name to your one `DaVinci_Resolve_20.0.1_Linux.run`
```bash 
sudo SKIP_PACKAGE_CHECK=1 ./DaVinci_Resolve_20.0.1_Linux.run -i
```

## Davinchi resolve is not Opening Issue 
as above `zlib`issue davinch uses older version of files so it checks whether the file is correct or avalable but davinchi resolve installed files says it cannot find the required files (i think those system files are avalable but in defferent name ) so we are going to move current files and nextime Davinchi opens it will check files avalabiliy and we have soved them so it will request new files from system and sytem will give correct files 
 to do that
```bash 
cd /opt/resolve/libs
sudo mkdir disabled-libraries
sudo mv libglib* disabled-libraries
sudo mv libgio* disabled-libraries
sudo mv libgmodule* disabled-libraries

```

you can do this manualy as well 
- Go to `/opt/resolve/libs ` and open libs folder as `sudo or super user` 
- create new folder (eg:disabled-libraries)
- and move files that start from `libg` to 
- and open davinchi resolve again 

#### Next
install some depenancies 
check where the `.desktop` file  is located
```bash 
sudo dnf install libxcrypt-compat libcurl libcurl-devel mesa-libGLU
/usr/share/applications/resolve.desktop
/usr/share/applications/com.blackmagicdesign.resolve.desktop
```
- Run davinchi resolve using Terminal
```bash
/opt/resolve/bin/resolve
```
### Fixing the DaVinci Resolve Desktop Launcher icon missing (.desktop file)
- give permission for `.desktop` file 
	- change file location base on yor matchine and file name tipicaly it is in /usr/share/applications/ folder 

```bash
sudo chmod +x /usr/share/applications/com.blackmagicdesign.resolve.desktop
```
find correct VM path
- open Davinchi using terminal
```bash
/opt/resolve/bin/resolve
```
open another terminal session and run followin command 
```bash
xprop | grep WM_CLASS
```
and you will see line like this `WM_CLASS(STRING) = "resolve", "Resolve"` or `WM_CLASS(STRING) = "resolve", "resolve"`

next Open .desktop file that we have given exicutable permission before 
```bash
sudo nano /usr/share/applications/com.blackmagicdesign.resolve.desktop
```
check whetere the following line is in there (resolve or Resolve compatibale with above output)

```bash 
StartupWMClass=resolve
```

if it is not there then add it 
then it will look like this -

```text
[Desktop Entry]
Version=1.0
Type=Application
Name=DaVinci Resolve
Exec=/opt/resolve/bin/resolve %u
Icon=resolve
StartupWMClass=resolve
Categories=AudioVideo;Video;Editing;
```
and save file 

- update desktop database 
```bash 
sudo update-desktop-database
```

## unsupported gpu processing mode 
 Sinche i am using Intel UHD Graphics it need to add some packages 
 
### Step-by-Step Guide to Prepare Intel UHD GPU OpenCL for DaVinci Resolve on Fedora 42
Remove Conflicting OpenCL ICD Packages

Fedora 42 includes a conflict between ocl-icd and OpenCL-ICD-Loader. To avoid this, remove ocl-icd if installed:
```bash
sudo dnf remove ocl-icd
```
Install Intel OpenCL Drivers
Install the Intel OpenCL runtime packages; add --allowerasing to allow dnf to resolve conflicts by removing conflicting packages:

```bash
sudo dnf install intel-opencl --allowerasing
```
Install Mesa OpenCL (Mesa-libOpenCL)

The package mesa-opencl does not exist on Fedora, install the correct Mesa OpenCL package
```bash
sudo dnf install mesa-libOpenCL
```
Verify OpenCL Installation

Check your OpenCL devices and capabilities to confirm installation:

```bash
clinfo
```

