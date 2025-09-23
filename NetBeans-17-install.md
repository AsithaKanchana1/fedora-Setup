# NetBeans 17 Installation on Fedora

NetBeans 17 can be installed on Fedora by downloading the official installer or RPM package, with Java 17 required for proper operation. Both manual and Snap-based methods work, but using the RPM is straightforward and recommended for Fedora.

## Manual (RPM) Installation

### 1. Install Java 17 if needed

```bash
sudo dnf install java-17-openjdk java-17-openjdk-devel
```

Confirm with:

```bash
java -version
```

Should display Java 17.

### 2. Download NetBeans 17 RPM

```bash
wget https://archive.apache.org/dist/netbeans/netbeans-installers/17/apache-netbeans-17-0.noarch.rpm
```

Alternatively, use the official mirror or NetBeans archive for latest links.

### 3. Install NetBeans 17

```bash
sudo dnf install ./apache-netbeans-17-0.noarch.rpm
```

Replace with actual filename if different.

### 4. Launch NetBeans

From the applications menu

Or run:

```bash
netbeans
```

## Alternative: Snap Package

If RPM installation fails, use Snap:

```bash
sudo dnf install snapd
sudo systemctl enable --now snapd
sudo snap install netbeans --classic
```