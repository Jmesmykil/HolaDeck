# HaloDeck — Unified native Halo for Steam Deck & Linux

## Current release: Unified Preview 2.8.1 (pre-release candidate)

[Download the v0.2.8.1 prerelease](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.8.1-steamdeck-unifiedhotfix). It includes the updated runtime archive, source snapshot, supported-mods guide, release notes, manifest and SHA256SUMS. One executable includes campaign, online co-op, native multiplayer, custom CE map setup, host character presets and separate server filters. Preview 2.8 remains available for rollback.

The creator's main Deck app remains `/home/deck/Games/HaloCE`; its executable, launcher and saves have pre-upgrade backups. Supply your own Xbox maps in `assets/maps`. Launch `launch_halo.sh` natively from Steam, with Proton off. Saves remain `~/.local/share/halo-linux`.

## Main menu

- **Multiplayer:** campaign join/host, multiplayer join/host, all-community discovery and source/version filters. Online campaign uses remote players without a second local controller. Local split-screen remains separate.
- **Custom Maps & Mods:** local `.map` or single-map ZIP import, HaloNet clipboard download, map folder access, campaign character and host match character selection.
- **Match Presets / Faction Teams:** Team SWAT, map-dependent Tower of Power, grenade Dodgeball, Zombies infection and native Race; Covenant/Marines/Flood pairings use map-loaded assets. Race requires track flags. Live preset matches remain unverified.
- **Host profiles V21 / V20 / V11:** selected in the same executable. V11 is multiplayer-only. Native room joins select the advertised profile in-process.
- **Host Match Character:** selects a map-local biped for server-created multiplayer/co-op player units. Missing bipeds retain the map standard. Stock multiplayer maps do not gain campaign assets automatically.

CE609 maps load directly through the native importer. Import owner-supplied `bitmaps.map`, `sounds.map` and `loc.map` companions into `assets/maps/ce` when referenced. OpenSauce `.yelo`, Chimera Lua/DLL and other engine extensions require individual native ports. Classic Halo PC/CE address snapshots stay separately listed and require a classic protocol client. [Supported content and mod path](releases/v0.2.8.1-steamdeck-unifiedhotfix/SUPPORTED-MODS.md).

## Authoritative unified source

[`unified/`](unified) contains the complete unified source snapshot used for this runtime. Its OpenCE base is `76b1898ee14e6fb58e0412acc183da509c10e001`, with the native CE loader, NxHalo characters/lobby, content setup and network profiles reconciled into it. The earlier root source is retained as history.

```sh
cd unified
python3 configure.py --release --portable --pgo=off --lto=thin
ninja linux
```

Use 32-bit SDL3; the build notes describe the SteamOS libm shim. A compatible owner-supplied shader instruction include is required. No game data, instruction tokens, console keys or personal saves are published.

## Verification

Preview 2.8.1 binary SHA-256: `d7eb374e9f1c3dc010f18445b6c97092722a6d96e18ded9800b8cfea0330e1c6`. It passed a 22-second native Omarchy Death Island smoke (actor loaded, ticks 31–393, health 1), production missing-map guard cases and a 12-second native missing-CE host probe without relaunch/crash. TLS production 32-bit cleanup checks and two-thread HTTPS CA downloads passed. The 2.8.1 build is not yet installed or running on the Deck; the last verified Deck install hash was Preview 2.8 `2154e51b9e80077d71fd3102fe4d375fe5ef70a8a0009f866c7bb5bc23488a65`; the latest device check found no Halo process running.

Prior Deck runs on 2.8 confirmed custom-map download/load/join and both tested controller inputs. Logged multiplayer evidence includes a profile 21 campaign join-in-progress on b30/a30 at 00:33:46/01:27:16, a profile 11 Blood Gulch 28-player session from 07:58:17 to a network disconnect at 08:00:49, and an Infinity CE retry followed by profile 20 loading at 08:37:32 on October 7. These runs do not establish every feature on 2.8.1. The invalid menu index/widget root cause remains unresolved; current instrumentation only records bounded diagnostics. Full 128-player acceptance, live preset matches, Friends and voice remain unverified. [2.8.1 release notes](releases/v0.2.8.1-steamdeck-unifiedhotfix/release-notes.md).

## Credits and licenses

The Halo decompilation, OpenCE, native ports and bundled libraries retain their authors and licenses. [CREDITS.md](CREDITS.md) records project credits; source-file and library notices govern their respective code. HaloDeck's documentation is CC0. This unofficial fan project is not endorsed by Microsoft, Bungie or Halo Studios.
