# Build

This repo builds a custom ISO by overlaying files on top of the official EndeavourOS-ISO tree.

## Host requirements

- EndeavourOS installed (recommended) or an Arch based system with EndeavourOS repository enabled.
- `archiso`, `git`, `squashfs-tools`.

## One command build

```bash
./scripts/build-iso.sh
```

## Manual build steps

1. Clone EndeavourOS-ISO

```bash
git clone https://github.com/endeavouros-team/EndeavourOS-ISO.git
cd EndeavourOS-ISO
./prepare.sh
```

If you want a stable release base, check out a tagged release from the EndeavourOS-ISO repo before running `prepare.sh`.

2. Apply overlay from this repo

```bash
rsync -a --delete "/path/to/os-linux/overlay/" ./
```

3. Add extra packages

```bash
cat /path/to/os-linux/packages/extra-packages.txt >> packages.x86_64
```

4. Remove packages (optional)

```bash
if [ -s /path/to/os-linux/packages/remove-packages.txt ]; then
  grep -v -F -f /path/to/os-linux/packages/remove-packages.txt -i packages.x86_64 > /tmp/pkg.new
  mv /tmp/pkg.new packages.x86_64
fi
```

5. Build ISO

```bash
sudo ./mkarchiso -v "."
```

The ISO will appear in the `out/` directory of EndeavourOS-ISO.
