# Installer and Multiboot

The installer is Calamares (EndeavourOS fork). This repo customizes partitioning defaults so Windows is preserved unless the user explicitly chooses erase.

## Multiboot behavior

- Default option is **Install alongside**.
- **Erase disk** is available but must be selected explicitly.
- **Manual partitioning** is allowed for advanced users.
- Windows detection is enabled so existing Windows partitions are preserved and boot entries are created.

## Swap size selection

- The installer offers swap choices (none, small, suspend, swapfile).
- Users can pick a swapfile or choose manual partitioning to set exact swap size.

## Partition size guidance

- The alongside install screen includes a size slider. You can choose the Linux size.
- Recommended minimum for gaming: 40 GB.
- You can select smaller sizes, but Minecraft + shaders will be constrained.

## Calamares configs

- `overlay/airootfs/etc/calamares/modules/partition.conf`
- `overlay/airootfs/etc/calamares/modules/bootloader.conf`
- `overlay/airootfs/etc/calamares/modules/users.conf`
- `overlay/airootfs/etc/calamares/branding/win11/branding.desc`

## Windows safety notes

- The default flow never touches Windows partitions.
- Users must explicitly select erase disk to overwrite.
- We keep EFI System Partition (ESP) and add a new boot entry for this OS.
- GRUB is configured to detect Windows automatically.
