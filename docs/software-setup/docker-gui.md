

<!-- toc -->

- [Docker Desktop GUI Install](#docker-desktop-gui-install)
  * [Pre Requsists](#pre-requsists)
  * [Installation](#installation)
  * [Install the package:](#install-the-package)
  * [Key points:](#key-points)
  * [If you see issues with Docker Engine not starting after launching the Docker Desktop GUI, check if docker service is enabled and running:](#if-you-see-issues-with-docker-engine-not-starting-after-launching-the-docker-desktop-gui-check-if-docker-service-is-enabled-and-running)
    + [Further learning:](#further-learning)

<!-- tocstop -->

# Docker Desktop GUI Install 

## Pre Requsists
- Docker [.rpm](https://docs.docker.com/desktop/setup/install/linux/fedora/#install-docker-desktop) package 
[Download](https://docs.docker.com/desktop/setup/install/linux/fedora/#install-docker-desktop)


## Installation 

- Install required dependencies (if using GNOME Desktop):
```bash
sudo dnf install gnome-terminal
```
- Set up Docker's package repository (not strictly required just for Desktop, but useful for engine updates):
```bash
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
```
- Download the Docker Desktop RPM package

[Go to Docker's official Linux Install page and download the RPM appropriate to your Fedora version.](https://docs.docker.com/desktop/setup/install/linux/fedora/#install-docker-desktop)

   - Example file: docker-desktop-x86_64.rpm (the actual version may vary).

## Install the package:
```bash
sudo dnf install ./docker-desktop-x86_64.rpm
```
- The installer will execute post-install scripts for setup (privileges, symlinks, host config).

- Launch Docker Desktop GUI:

   - Open your Activities/applications menu and search for "Docker".

   - Launch the app, accept terms, and begin using the graphical interface.

- You can enable Docker Desktop to start automatically on login in the app settings ("Settings" → "General" → "Start Docker Desktop when you log in").

## Key points:

- Docker Desktop provides a graphical user interface for Docker, making it easier to manage containers and images without relying solely on CLI.

- You can still install and use only the CLI-based Docker Engine if you do not want the GUI, which is common for server environments or pure automation use.

Troubleshooting:

## If you see issues with Docker Engine not starting after launching the Docker Desktop GUI, check if docker service is enabled and running:

```bash
sudo systemctl enable --now docker
sudo systemctl status docker
```
- This ensures the underlying engine required by Docker Desktop is active.

### Further learning:

- To use Docker without root, add your user to the docker group:

```bash
sudo usermod -aG docker $USER
```
   - Then log out and back in for changes to take effect.

- This procedure provides you a full graphical-container management experience on Fedora. For your projects, Docker Desktop also includes integrations for Compose, Kubernetes, and other developer tools.


