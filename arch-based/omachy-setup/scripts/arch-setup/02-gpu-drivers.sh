#!/bin/bash
# =============================================================================
# Module 02 — GPU Driver Detection & Installation
# Detects NVIDIA or Intel GPU and installs the appropriate drivers.
# Required for DaVinci Resolve GPU acceleration.
# =============================================================================

echo ""
echo "==> [2/6] GPU Driver Detection"
echo "-------------------------------"

if lspci | grep -qi nvidia; then
    echo "  NVIDIA GPU detected — installing NVIDIA drivers + OpenCL..."
    yay -S --noconfirm --needed nvidia-utils lib32-nvidia-utils opencl-nvidia
elif lspci | grep -qi intel; then
    echo "  Intel GPU detected — installing Intel compute runtime + VA drivers..."
    yay -S --noconfirm --needed intel-compute-runtime libva-intel-driver
else
    echo "  No supported GPU detected — skipping GPU driver installation."
fi
