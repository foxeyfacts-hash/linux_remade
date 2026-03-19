#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EOS_DIR="${1:-$ROOT_DIR/EndeavourOS-ISO}"

if [ ! -d "$EOS_DIR" ]; then
  echo "EndeavourOS-ISO directory not found: $EOS_DIR" >&2
  exit 1
fi

if [ ! -d "$ROOT_DIR/overlay" ]; then
  echo "overlay/ directory not found in $ROOT_DIR" >&2
  exit 1
fi

echo "[1/3] Copy overlay to EndeavourOS-ISO"
rsync -a "$ROOT_DIR/overlay/" "$EOS_DIR/"

echo "[1/3a] Fix permissions and enable services"
chmod +x "$EOS_DIR/airootfs/usr/local/bin/"* || true
chmod +x "$EOS_DIR/airootfs/usr/share/win11/scripts/"* || true
chmod +x "$EOS_DIR/airootfs/etc/skel/.config/plasma-workspace/env/"* || true

mkdir -p "$EOS_DIR/airootfs/etc/systemd/system/graphical.target.wants"
ln -sf ../win11-setupuser.service "$EOS_DIR/airootfs/etc/systemd/system/graphical.target.wants/win11-setupuser.service"
mkdir -p "$EOS_DIR/airootfs/etc/systemd/system/multi-user.target.wants"
ln -sf ../win11-calamares-setup.service "$EOS_DIR/airootfs/etc/systemd/system/multi-user.target.wants/win11-calamares-setup.service"

echo "[2/3] Add extra packages"
if [ -f "$ROOT_DIR/packages/extra-packages.txt" ]; then
  cat "$ROOT_DIR/packages/extra-packages.txt" >> "$EOS_DIR/packages.x86_64"
fi

if [ -s "$ROOT_DIR/packages/remove-packages.txt" ]; then
  echo "[3/3] Remove packages"
  grep -v -F -f "$ROOT_DIR/packages/remove-packages.txt" -i "$EOS_DIR/packages.x86_64" > /tmp/pkg.new
  mv /tmp/pkg.new "$EOS_DIR/packages.x86_64"
else
  echo "[3/3] No packages to remove"
fi

# Deduplicate package list
sort -u "$EOS_DIR/packages.x86_64" -o "$EOS_DIR/packages.x86_64"

echo "Overlay applied."
