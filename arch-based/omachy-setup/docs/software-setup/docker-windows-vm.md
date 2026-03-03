# Docker & Windows VM — Disable Auto-Start

> **Context**: Omarchy ships with a Windows environment containerised via [dockurr/windows](https://github.com/dockurr/windows) running as a Docker container named `omarchy-windows`. Docker's restart policy caused the container (and therefore the Windows VM) to respawn automatically on every boot, consuming **~4 GB of RAM** at idle.
>
> **Goal**: Stop the container, remove its auto-restart policy, disable the background Docker systemd services, and provide a convenient alias to start everything back up only when needed.

---

## 1. Why So Much RAM?

| Layer | Description |
|---|---|
| **Docker daemon** | Background service that manages containers |
| **containerd** | Low-level container runtime (runs alongside Docker) |
| **omarchy-windows** | Dockerised Windows VM pre-allocated with **4.0 GB** of RAM |

On Omarchy the container is started automatically through Docker's `--restart=always` policy, which means even after a manual `kill`, the process immediately respawns. Stopping the Docker services at the daemon level is the only reliable fix.

---

## 2. Stop & Disable — One-Time Setup

Run the following commands **once** to stop the VM and prevent it from starting automatically at boot:

```bash
# 1. Gracefully stop the running Windows VM container
docker stop omarchy-windows

# 2. Remove the auto-restart policy from the container
docker update --restart=no omarchy-windows

# 3. Stop and disable the Docker-related systemd services
sudo systemctl disable --now docker.service docker.socket containerd.service
```

> **Result**: After a reboot your idle RAM should drop from ~8–9 GB to roughly **2–3 GB**, matching a standard Fedora idle baseline.

---

## 3. Create a "Start When Needed" Alias

Because you still need the Windows environment occasionally (e.g. for Newlanka Clothing PLC builds), create a shell alias that brings everything back up on demand.

### Add the alias to `~/.zshrc`

```bash
# Open your Zsh config
nvim ~/.zshrc
```

Append the following lines at the bottom of the file:

```zsh
# ── Docker / Windows VM helpers ──────────────────────────────────────────────
# Start Docker services + Windows VM container (only when needed)
alias start-win='sudo systemctl start docker && docker start omarchy-windows'

# Stop Windows VM + Docker services to reclaim RAM when done
alias stop-win='docker stop omarchy-windows && sudo systemctl stop docker.service docker.socket containerd.service'
```

Apply without restarting the terminal:

```bash
source ~/.zshrc
```

### Usage

| Command | Effect |
|---|---|
| `start-win` | Starts Docker daemon, then boots the Windows VM container |
| `stop-win` | Shuts down the Windows VM, then stops the Docker daemon |

---

## 4. Verify the Changes

```bash
# Confirm the container is stopped
docker ps -a | grep omarchy-windows
# Expected: STATUS column shows "Exited"

# Confirm Docker services are disabled
systemctl is-enabled docker.service docker.socket containerd.service
# Expected: "disabled" for all three

# Check current RAM usage
free -h
# Expected: Used memory ~2–3 GB at idle
```

---

## 5. Re-enable Auto-Start (Rollback / Undo)

If you ever want to restore automatic startup:

```bash
# Re-enable Docker services at boot
sudo systemctl enable --now docker.service docker.socket containerd.service

# Restore the auto-restart policy on the Windows container
docker update --restart=always omarchy-windows
```

---

## 6. Quick Reference

```
RAM Savings Overview
────────────────────────────────
 Before (auto-start enabled) : ~8–9 GB idle
 After  (services disabled)  : ~2–3 GB idle
 Savings                      : ~4–6 GB
────────────────────────────────

Services disabled:
  • docker.service
  • docker.socket
  • containerd.service

Container restart policy changed:
  • omarchy-windows  always → no
```

---

*Last Updated: February 2026*
*Applies to: Omarchy (Arch-based) with dockurr/windows*
*Created By: Asitha Kanchana Palliyaguru*
