# Minecraft Focus

## Launcher

- Prism Launcher is preinstalled.
- A preconfigured instance is copied to `/usr/share/win11/minecraft/instance`.

## Java LTS

- Java LTS package is installed and defaulted for Minecraft.

## Default JVM flags

Configured in `/usr/share/win11/minecraft/instance/instance.cfg`:

- Use G1GC and tuned allocation.
- Pre-set memory values that the user can change in Prism.

## Mods

- Fabric and Forge are supported.
- A one-click script installs common performance mods (Sodium, Lithium, Starlight) when available.

## Files

- `overlay/airootfs/usr/share/win11/minecraft/instance/instance.cfg`
- `overlay/airootfs/usr/share/win11/minecraft/instance/mmc-pack.json` (set MC and loader versions here)
- `overlay/airootfs/usr/local/bin/win11-mc-mods`
