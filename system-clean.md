

<!-- toc -->

- [How To Clean Up System Junk](#how-to-clean-up-system-junk)
  * [Prune unused packages](#prune-unused-packages)
    + [Remove orphaned packages](#remove-orphaned-packages)
    + [Delete cached RPMs](#delete-cached-rpms)
    + [Clear Flatpak leftovers (if you use Flathub)](#clear-flatpak-leftovers-if-you-use-flathub)
    + [npm/yarn/pnpm cache purge](#npmyarnpnpm-cache-purge)
    + [Android SDK & emulator housekeeping](#android-sdk--emulator-housekeeping)
    + [Prune Docker/Podman resources (Document Server, etc.)](#prune-dockerpodman-resources-document-server-etc)
    + [Vacuum journal logs](#vacuum-journal-logs)
    + [Purge temporary files](#purge-temporary-files)
    + [Remove old kernels (if you compile custom ones)](#remove-old-kernels-if-you-compile-custom-ones)
    + [Analyse large files interactively](#analyse-large-files-interactively)
    + [Automate future cleanup](#automate-future-cleanup)
  * [Quick checklist before you start](#quick-checklist-before-you-start)

<!-- tocstop -->

# How To Clean Up System Junk

## Prune unused packages
### Remove orphaned packages
DNF can identify libraries that were pulled in as dependencies but are no longer needed
```bash
sudo dnf autoremove
```
- Review the list before confirming; ensure it does not list tools you still use.

### Delete cached RPMs
Every dnf install/upgrade leaves copies in /var/cache/dnf.

```bash
sudo dnf clean packages
```

- Typical savings: 200–800 MB, depending on update history.

### Clear Flatpak leftovers (if you use Flathub)
```bash
# Remove unused runtimes
flatpak uninstall --unused
# Purge old revisions
flatpak repair
```
- Runtimes can consume several GB if you test many Flatpak apps.

### npm/yarn/pnpm cache purge
- JavaScript tooling builds enormous caches under your home directory.

```bash
# npm
npm cache clean --force
# yarn
yarn cache clean
# pnpm
pnpm store prune
```

- Then inspect ~/.cache/npm, ~/.cache/yarn, or ~/.local/share/pnpm/store and delete anything older than your active projects.

### Android SDK & emulator housekeeping
List obsolete SDK components

```bash
yes | sdkmanager --list_installed | grep Obsolete
```
Remove them:

```bash
yes | sdkmanager --uninstall "system-images;android-28;*;*" \
                                  "platforms;android-28"
```
Delete unused AVD images:

```bash
avdmanager list avd
rm -rf ~/.android/avd/NAME.avd
```
These directories live in ~/Android/Sdk; each old system image can be 1–2 GB.

### Prune Docker/Podman resources (Document Server, etc.)
```bash
# Remove stopped containers
podman container prune -f
# Remove dangling images
podman image prune -f
# Delete unused volumes
podman volume prune -f
```
- Run the same commands with docker if you use Docker instead of Podman.

### Vacuum journal logs
- Fedora keeps boot logs forever unless told otherwise.

```bash
# Keep only the last 2 weeks or 500 MB, whichever is smaller
sudo journalctl --vacuum-time=2weeks --vacuum-size=500M
```
### Purge temporary files
```bash
# System-wide tmp files older than 7 days
sudo tmpwatch --mtime 168 /tmp
# User cache older than 30 days (adjust as needed)
tmpwatch --mtime 720 ~/.cache
```
### Remove old kernels (if you compile custom ones)
```bash
sudo dnf remove $(rpm -q kernel | grep -v $(uname -r))
```
Keep at least one fallback kernel.

### Analyse large files interactively
When space is still tight, locate the biggest directories:

```bash
sudo dnf install -y ncdu
ncdu /           # system-wide
ncdu ~           # your home directory
```
- Navigate with arrow keys and delete (d) after verifying contents.

### Automate future cleanup
- Add periodic tasks with systemd timers:

- Create `~/.config/systemd/user/cache-clean.timer`

```text
[Timer]
OnCalendar=weekly
Persistent=true
```
- Create `~/.config/systemd/user/cache-clean.service`

```text
[Service]
ExecStart=/usr/bin/npm cache clean --force
ExecStart=/usr/bin/flatpak uninstall --unused -y
ExecStart=/usr/bin/journalctl --vacuum-size=500M
```
- Enable it:

```bash
systemctl --user enable --now cache-clean.timer

```
## Quick checklist before you start
- Back up important projects (git push or copy).

- Double-check orphan removal lists.

- Keep one working kernel and the Flatpak runtimes you actually use.

- Following these steps typically reclaims 3–10 GB on a developer workstation while keeping all your toolchains intact.





Updated [2025/08/02]
