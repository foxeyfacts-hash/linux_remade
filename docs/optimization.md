# Performance and Gaming Optimization

## Modes

- Performance: Max FPS, lowest latency.
- Balanced: Good performance with lower fan noise.
- Quality: Best visuals, keep compositor on.

Switch modes via:

```bash
sudo /usr/local/bin/win11-mode performance
sudo /usr/local/bin/win11-mode balanced
sudo /usr/local/bin/win11-mode quality
```

## Kernel and scheduling

- Install linux-zen for lower latency.
- Use `schedutil` governor in Balanced/Quality, `performance` in Performance.

## Memory and I/O

- Enable zram.
- Tune swappiness and vm.dirty ratios.

## Services

Disable nonessential services on install, keep security and update services on.

## Files

- `overlay/airootfs/etc/sysctl.d/99-win11-gaming.conf`
- `overlay/airootfs/usr/local/bin/win11-mode`
- `overlay/airootfs/usr/share/win11/modes/profiles/*.conf`