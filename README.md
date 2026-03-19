# Win11Craft OS (EndeavourOS + KDE Plasma)

A Windows 11 styled, Minecraft optimized EndeavourOS based distro using the official EndeavourOS ISO build system plus a custom overlay for UI/UX, performance, and gaming defaults.

## What this repo contains

- `overlay/` - Files copied on top of EndeavourOS-ISO to customize the live system and installed target.
- `scripts/` - Build and overlay scripts and performance tooling.
- `packages/` - Additional packages to add or remove vs. stock EndeavourOS KDE ISO.
- `docs/` - Architecture, build, installer, UI, Minecraft tuning.
- `ui/` - Design tokens (colors, spacing, typography, radii).

## Quick start (ISO build)

1. Build on EndeavourOS (recommended) so the EndeavourOS repository and Calamares packages are available.
2. Run the build script:

```bash
./scripts/build-iso.sh
```

The ISO will be created in the EndeavourOS-ISO `out/` directory.

## Rename the distro

Search and replace the placeholder name `Win11Craft OS` in:

- `overlay/airootfs/etc/calamares/branding/win11/branding.desc`
- `overlay/airootfs/etc/os-release`
- `overlay/airootfs/usr/share/sddm/themes/win11/theme.conf`
- `overlay/airootfs/usr/share/plasma/look-and-feel/com.win11.theme/metadata.json`

## Docs

- `docs/architecture.md`
- `docs/build.md`
- `docs/installer.md`
- `docs/ui-design-system.md`
- `docs/optimization.md`
- `docs/minecraft.md`
- `docs/windows-build.md`
