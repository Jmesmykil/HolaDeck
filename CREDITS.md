# Credits

HaloDeck is a patch, a launcher and a guide. The game it builds, and almost all of the work behind it, is other people's.

## The decompilation and its native ports

- **punpckhdq** started the Halo: Combat Evolved decompilation: [punpckhdq/halo](https://github.com/punpckhdq/halo).
- **bnunu** continued the decompilation: [bnunu/halo](https://github.com/bnunu/halo).
- **MrBruh** ([@cybersecurity](https://github.com/cybersecurity)) made the native ports that HaloDeck patches: [halo-ce-universal](https://github.com/cybersecurity/halo-ce-universal). That covers the Linux port with its OpenGL renderer, SDL3 sound and input, the Windows and Android ports, frame interpolation, `config.toml` settings, and the performance work.
- **Jonas Volman** did much of the decompilation's byte-matching work, and system link games of up to 128 players in the native builds.
- Everyone else who has contributed to those projects.

## Libraries and tools

- [SDL3](https://libsdl.org), by Sam Lantinga and the SDL contributors, zlib license: the window, OpenGL context, sound and input. It is the `libSDL3.so.0` you copy next to the game.
- [tomlc17](https://github.com/cktan/tomlc17), by CK Tan, MIT license: reads `config.toml`.
- libtiff, by Sam Leffler and Silicon Graphics, Inc., libtiff license: part of the game's own bitmap code.
- `ninja_syntax.py`, by Google Inc., Apache License 2.0: writes the build files.
- [musl](https://musl.libc.org), MIT license: the Android build's C library.
- [RXDK-Libs](https://github.com/Team-Resurgent/RXDK-Libs), by Team Resurgent, GPL-3.0-or-later: a reference for the decompilation's Direct3D 8 reconstruction (`libs/d3d8`, which the Linux build does not use).
- [pdb-decompiler](https://github.com/camden-smallwood/pdb-decompiler), by camden-smallwood: recovers type information from debug symbols for the decompilation.

## HaloDeck

- **Jmesmykil**: the Steam Deck launcher, retail USA map support, packaging and this guide.

## Halo

Halo: Combat Evolved was developed by Bungie and published by Microsoft. Halo, Xbox and Microsoft are trademarks of the Microsoft group of companies. HaloDeck is an unofficial fan project, not affiliated with or endorsed by Microsoft, Xbox Game Studios, Halo Studios or Bungie. It contains no game data.
