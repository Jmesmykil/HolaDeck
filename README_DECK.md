# HaloDeck — Native Halo CE for Steam Deck & Linux

This repository contains the reverse-engineered Halo: Combat Evolved native Linux port, optimized and tested for Valve Steam Deck (SteamOS) and x86_64 Linux.

## Features & Fixes
- **Retail Map Compatibility**: Supports retail USA Rev-2 maps (`01.10.12.2276`) alongside build `01.01.14.2342`.
- **Steam Deck Launcher**: Ships `port/linux/launch_halo.sh` configured with `mesa_glthread=true` and `HALO_FULLSCREEN=true` for Gamescope.
- **Standalone 32-bit Runtime**: `$ORIGIN` rpath linking with local SDL3 compatibility stubs.

## Building

Prerequisites:
- Clang / LLVM (32-bit multilib target support: `gcc-multilib` / `lib32-glibc`)
- Ninja build system
- 32-bit SDL3 development libraries

```sh
ninja linux
```
The output executable will be placed in `build/linux/halo`.

## Steam Deck Deployment

1. Create a game folder on your Steam Deck (e.g. `~/Games/HaloCE/`).
2. Copy `build/linux/halo`, `port/linux/launch_halo.sh`, and required libraries (`libSDL3.so`) to that directory.
3. Place your extracted Xbox Halo CE maps in `assets/maps/` (or `maps/`).
4. Add `launch_halo.sh` as a Non-Steam Game in Steam Desktop Mode.
5. In Game Mode, launch directly with native controller support.
