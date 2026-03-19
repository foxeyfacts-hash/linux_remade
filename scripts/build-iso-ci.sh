#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EOS_DIR="${1:-$ROOT_DIR/EndeavourOS-ISO}"

if [ ! -d "$EOS_DIR/.git" ]; then
  echo "Cloning EndeavourOS-ISO into $EOS_DIR"
  git clone https://github.com/endeavouros-team/EndeavourOS-ISO.git "$EOS_DIR"
fi

# CI-safe: disable EOS pre-squash hook that requires online mirror ranking
cat > "$EOS_DIR/run_before_squashfs.sh" <<'EOF'
#!/usr/bin/env bash
# Minimal hook for CI container builds
exit 0
EOF
chmod +x "$EOS_DIR/run_before_squashfs.sh"

if ! id builder >/dev/null 2>&1; then
  useradd -m -G wheel builder
  echo "builder ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/builder
  chmod 0440 /etc/sudoers.d/builder
fi

chown -R builder:builder "$EOS_DIR"

su - builder -c "cd \"$EOS_DIR\" && ./prepare.sh"

"$ROOT_DIR/scripts/apply-overlay.sh" "$EOS_DIR"

"$EOS_DIR/mkarchiso" -v "$EOS_DIR"
