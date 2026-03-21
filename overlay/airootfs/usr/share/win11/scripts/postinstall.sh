#!/usr/bin/env bash
set -euo pipefail

# Ensure low latency kernel
pacman -S --noconfirm --needed linux-zen linux-zen-headers
pacman -Rns --noconfirm linux linux-headers || true

# Enable services
systemctl enable sddm
systemctl enable ufw
systemctl enable win11-hw-detect.service

# Firewall defaults
ufw default deny incoming || true
ufw default allow outgoing || true
ufw --force enable || true

# Ensure GRUB detects other OSes
if [ -f /etc/default/grub ]; then
  if grep -q "GRUB_DISABLE_OS_PROBER" /etc/default/grub; then
    sed -i 's/^GRUB_DISABLE_OS_PROBER=.*/GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub
  else
    echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
  fi
  grub-mkconfig -o /boot/grub/grub.cfg || true
fi

# Default performance mode
mkdir -p /etc/win11
echo "balanced" > /etc/win11/mode

# Create default user (no password) and enable passwordless sudo
DEFAULT_USER="win11"
if ! id -u "$DEFAULT_USER" >/dev/null 2>&1; then
  groupadd -f games || true
  useradd -m -k /etc/skel -s /bin/bash -G wheel,audio,video,storage,games "$DEFAULT_USER"
  passwd -d "$DEFAULT_USER" >/dev/null 2>&1 || true
fi
echo "$DEFAULT_USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/90-win11-default-user
chmod 0440 /etc/sudoers.d/90-win11-default-user

# Ensure installed system autologins to the default user
mkdir -p /etc/sddm.conf.d
cat > /etc/sddm.conf.d/99-win11-autologin.conf <<EOF
[Autologin]
User=${DEFAULT_USER}
Session=plasmawayland
Relogin=true
EOF

exit 0
