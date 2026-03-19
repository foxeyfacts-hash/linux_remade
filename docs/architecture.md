# Architecture

This distro is an EndeavourOS KDE ISO with a Windows 11 style overlay. We do not replace EndeavourOS tooling; we layer on top of the official ISO build system and Calamares installer.

## Layers

- Boot layer
- Installer layer
- Base system
- Hardware and drivers
- Desktop and UX
- Gaming stack
- Performance modes
- Security

## Details

Boot layer:
- EndeavourOS ISO base (ArchISO).
- Systemd-boot for UEFI and Syslinux for BIOS (inherited from EndeavourOS-ISO).

Installer layer:
- Calamares (EndeavourOS fork) with custom branding and partition defaults.
- Multiboot-safe defaults (alongside Windows by default).

Base system:
- EndeavourOS base packages plus KDE Plasma.
- Btrfs root with Timeshift snapshots recommended.

Hardware and drivers:
- Mesa for AMD and Intel.
- NVIDIA proprietary drivers and Vulkan stack.

Desktop and UX:
- KDE Plasma with a Win11 look and feel package, centered taskbar, acrylic style theme.
- SDDM themed to match Win11.

Gaming stack:
- Gamemode, MangoHud, Vulkan, Proton and Wine helpers, Java LTS.
- Minecraft presets and Prism Launcher.

Performance modes:
- Performance, Balanced, Quality presets (CPU governor, I/O scheduler, KWin compositing).

Security:
- UFW enabled with sane defaults.

## Key overlay areas

- `overlay/airootfs/etc/calamares/` Calamares branding and modules.
- `overlay/airootfs/etc/skel/` Default user configs (KDE, theme, panel layout).
- `overlay/airootfs/usr/share/plasma/look-and-feel/` Win11 UI package.
- `overlay/airootfs/usr/local/bin/` First boot and tuning scripts.
- `overlay/airootfs/usr/share/win11/` Mode profiles and Minecraft presets.