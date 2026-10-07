# HaloDeck — Unified native Halo for Steam Deck & Linux

## Current build: Unified Preview 2.7

[Download the release](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.7-steamdeck-unified7): `NxHalo-SteamDeck-unified-preview2.7.tar.gz`, exact source, checksums and manifest. One executable includes campaign, online co-op, native multiplayer, custom CE map setup, host character presets and separate server filters. Previous releases remain available for rollback.

The creator's main Deck app remains `/home/deck/Games/HaloCE`; its executable, launcher and saves have pre-upgrade backups. Supply your own Xbox maps in `assets/maps`. Launch `launch_halo.sh` natively from Steam, with Proton off. Saves remain `~/.local/share/halo-linux`.

## Main menu

- **Multiplayer:** campaign join/host, multiplayer join/host, all-community discovery and source/version filters. Online campaign uses remote players without a second local controller. Local split-screen remains separate.
- **Custom Maps & Mods:** local `.map` or single-map ZIP import, HaloNet clipboard download, map folder access, campaign character and host match character selection.
- **Host profiles V21 / V20 / V11:** selected in the same executable. V11 is multiplayer-only. Native room joins select the advertised profile in-process.
- **Host Match Character:** selects a map-local biped for server-created multiplayer/co-op player units. Missing bipeds retain the map standard. Stock multiplayer maps do not gain campaign assets automatically.

CE609 maps load directly through the native importer. Import owner-supplied `bitmaps.map`, `sounds.map` and `loc.map` companions into `assets/maps/ce` when referenced. OpenSauce `.yelo`, Chimera Lua/DLL and other engine extensions require individual native ports. Classic Halo PC/CE address snapshots stay separately listed and require a classic protocol client. [Supported content and mod path](releases/v0.2.7-steamdeck-unified7/SUPPORTED-MODS.md).

## Authoritative unified source

[`unified/`](unified) contains the complete unified source snapshot used for this runtime. Its OpenCE base is `76b1898ee14e6fb58e0412acc183da509c10e001`, with the native CE loader, NxHalo characters/lobby, content setup and network profiles reconciled into it. The earlier root source is retained as history.

```sh
cd unified
python3 configure.py --release --portable --pgo=off --lto=thin
ninja linux
```

Use 32-bit SDL3; the build notes describe the SteamOS libm shim. A compatible owner-supplied shader instruction include is required. No game data, instruction tokens, console keys or personal saves are published.

## Verification

The installed Deck hash matches the package. Physical captures show the new content/network menus; map archive fixtures and native linking passed. A reproduced keepalive stack overwrite was fixed with bounded packet scratch storage and independently reviewed. Private hosts initialized under all three profiles after the fix, but synthetic joins did not succeed. Real CE gameplay, two-client interoperability, alternate-character matches, full download/join and controller moderation remain unverified. Friends and voice remain future work. [Release notes](releases/v0.2.7-steamdeck-unified7/release-notes.md).

## Credits and licenses

The Halo decompilation, OpenCE, native ports and bundled libraries retain their authors and licenses. [CREDITS.md](CREDITS.md) records project credits; source-file and library notices govern their respective code. HaloDeck's documentation is CC0. This unofficial fan project is not endorsed by Microsoft, Bungie or Halo Studios.
