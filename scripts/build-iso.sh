#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EOS_DIR="${1:-$ROOT_DIR/EndeavourOS-ISO}"

if [ ! -d "$EOS_DIR/.git" ]; then
  echo "Cloning EndeavourOS-ISO into $EOS_DIR"
  git clone https://github.com/endeavouros-team/EndeavourOS-ISO.git "$EOS_DIR"
fi

pushd "$EOS_DIR" >/dev/null
./prepare.sh
popd >/dev/null

"$ROOT_DIR/scripts/apply-overlay.sh" "$EOS_DIR"

sudo "$EOS_DIR/mkarchiso" -v "$EOS_DIR"