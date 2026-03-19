# Build on Windows

You cannot build ArchISO on Windows directly. Use one of these Windows friendly options:

## Option A (recommended): GitHub Actions build

This repo includes a CI workflow that builds the ISO on a Linux runner. You only need Git and a GitHub account.

1. Create a GitHub repo and push this project.
2. Go to the Actions tab.
3. Run the workflow: **Build ISO**.
4. Download the artifact `win11craft-iso` from the workflow run.

Workflow file:
- `.github/workflows/build-iso.yml`

## Option B: Local VM build (no Linux install on main OS)

1. Install VirtualBox or VMware.
2. Create a VM with 8+ GB RAM and 50+ GB disk.
3. Install EndeavourOS inside the VM.
4. In the VM:

```bash
sudo pacman -S --needed git archiso rsync squashfs-tools
cd /path/to/os-linux
./scripts/build-iso.sh
```

The ISO appears in `EndeavourOS-ISO/out/`.

## Option C: WSL2 (may fail on some systems)

WSL2 support for `mkarchiso` depends on kernel features (loop devices, mounts). If it fails, use Option A or B.

1. Install WSL2 and an Arch WSL distro.
2. Inside WSL:

```bash
sudo pacman -S --needed archiso git rsync squashfs-tools
./scripts/build-iso.sh
```