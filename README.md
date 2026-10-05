# HaloDeck — Native Halo CE for Steam Deck & Linux

HaloDeck runs Halo: Combat Evolved natively on the Valve Steam Deck (SteamOS) and other x86-64 Linux PCs, optimized and tested for the Steam Deck. It is a patch, a launcher and this guide for [halo-ce-universal](https://github.com/cybersecurity/halo-ce-universal), MrBruh's native Linux port of the community's Halo decompilation: building fetches that project's source and applies the patch.

This repository contains no game data, and of the decompiled game code only the few lines its patch changes. You need the maps from your own copy of the Xbox game.

## Prebuilt Releases (Recommended for Players)

Download the prebuilt native package from [Releases](https://github.com/Jmesmykil/HolaDeck/releases):
1. Download `NxHalo-SteamDeck.tar.gz` and extract it to your Steam Deck.
2. Supply your own compatible original Xbox Halo game maps into `assets/maps/` inside the extracted folder. No game data, ROM, maps, or keys are provided.
3. Add `launch_halo.sh` as a Non-Steam Game in Steam Desktop Mode.
4. Launch directly in SteamOS Game Mode.
5. On Wi-Fi: Disable "Wi-Fi Power Management" in Steam Deck Developer Settings to minimize latency.

**Latest published build: v0.2.0 — Steam Deck preview 1 (pre-release), network version 11.** The release includes the Deck runtime archive, matching source archive, release manifest, and SHA-256 checksums. See the [v0.2.0 release notes](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.0-steamdeck-preview1) for tested behavior and known issues. The Nintendo Switch campaign package is released separately in [NxHalo-Releases](https://github.com/Jmesmykil/NxHalo-Releases/releases/tag/v0.1.1-build14) as Build14 / v0.1.1; this Deck release does not update the Switch runtime.

## What the patch adds

- **Retail map compatibility**: loads the retail USA Rev-2 maps (`01.10.12.2276`) alongside the PAL data of build `01.01.14.2342`, and keeps their cached copies between sessions.
- **Steam Deck launcher**: `port/linux/launch_halo.sh` starts the game from its own folder, where it finds its maps and libraries. Added as a Non-Steam Game, it runs in Game Mode with controller support.
- **Self-contained game folder**: the executable finds a 32-bit `libSDL3.so.0` copied next to it (or into `lib/` there), so nothing has to be installed on the Deck.
- **`configure.py --linux-lib-dir`**: links with a 32-bit SDL3 that is not installed system-wide, for example one unpacked into `lib32/` on a Steam Deck, whose system files are read-only.

## Building

Prerequisites:
- git, Python 3 and the Ninja build system
- Clang and LLD (the default build is link-time optimised, and links with `ld.lld`)
- 32-bit glibc development files (`lib32-glibc` on Arch, `gcc-multilib` on Debian/Ubuntu)
- 32-bit SDL3 (`lib32-sdl3` on Arch, `libsdl3-dev:i386` on Debian/Ubuntu)

```sh
git clone https://github.com/Jmesmykil/HolaDeck.git
git clone https://github.com/cybersecurity/halo-ce-universal.git
cd halo-ce-universal
git checkout d9b12fd42e1ec5528518223a65f8be6888cd33a2
git apply ../HolaDeck/halodeck.patch
python configure.py --portable --release
ninja linux
```

The game is built as `build/linux/halo`.

- `--portable` builds for any x86-64 processor. Without it the build is optimised for the processor of the computer that builds it (`-march=native`), and may not start on a Steam Deck if it was built on another computer.
- `--release` builds the game as the retail game was built: it does not stop at the first failed assertion. Leave it out for a debug build.
- If the 32-bit SDL3 is not installed where the linker looks, add `--linux-lib-dir` with its folder, for example `--linux-lib-dir lib32/usr/lib32` for the `lib32-sdl3` package unpacked into `halo-ce-universal/lib32/`.

## Installing on the Steam Deck

1. Create a game folder on your Steam Deck (e.g. `~/Games/HaloCE/`).
2. From `halo-ce-universal`, copy `build/linux/halo` and `port/linux/launch_halo.sh` to that folder, together with the 32-bit `libSDL3.so.0`. The library is in `/usr/lib32/` on Arch, `/usr/lib/i386-linux-gnu/` on Debian/Ubuntu, or `lib32/usr/lib32/` if you unpacked it there. Copy the library itself, not a symbolic link to it: `cp -L /usr/lib32/libSDL3.so.0 ~/Games/HaloCE/`.
3. Place your extracted Xbox Halo CE maps in `maps/` (or `assets/maps/`) in that folder.
4. Add `launch_halo.sh` as a Non-Steam Game in Steam Desktop Mode.
5. In Game Mode, launch directly with native controller support.

The game writes its settings to `config.toml` next to `halo` on its first run; a Steam launch option such as `HALO_FULLSCREEN=false %command%` overrides one for a single run. Saved games and the game's cache of copied maps (about 800 MB) go to `~/.local/share/halo-linux`. The controls and every setting are described in `port/linux/README.md` in `halo-ce-universal`, and these notes again in `README_DECK.md` there once the patch is applied.

## Credits

HaloDeck is built on the Halo decompilation started by punpckhdq and continued by bnunu, on MrBruh's native ports, and on the work of Jonas Volman and everyone else who contributed to them. [CREDITS.md](CREDITS.md) lists them all, with the libraries the port uses.

## License

HaloDeck's own files (this guide, the credits and the patch) are released under CC0 1.0: see [LICENSE.md](LICENSE.md). halo-ce-universal and the libraries it uses have their own licenses.

Halo: Combat Evolved was developed by Bungie and published by Microsoft. HaloDeck is an unofficial fan project, not affiliated with or endorsed by Microsoft, Xbox Game Studios, Halo Studios or Bungie. Halo, Xbox and Microsoft are trademarks of the Microsoft group of companies.
