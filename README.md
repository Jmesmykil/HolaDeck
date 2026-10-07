# HaloDeck — Unified native Halo for Steam Deck & Linux

## Current release: Unified Content Preview 2.9 (pre-release)

[Download the v0.2.9 prerelease](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.9-steamdeck-content). It includes the runtime archive, unified source snapshot, native content guide, supported-mods guide, release notes, manifest and SHA256SUMS. The one native executable includes a live CE map catalog, texture-pack overrides and Deck-gated Off/Quality/Performance rendering alongside campaign, online co-op and multiplayer. Previews 2.8 and 2.8.1 remain available for rollback.

The creator's main Deck app remains `/home/deck/Games/HaloCE`; its executable, launcher and saves have pre-upgrade backups. Supply your own Xbox maps in `assets/maps`. Launch `launch_halo.sh` natively from Steam, with Proton off. Saves remain `~/.local/share/halo-linux`.

## Main menu

- **Multiplayer:** campaign join/host, multiplayer join/host, all-community discovery and source/version filters. Online campaign uses remote players without a second local controller. Local split-screen remains separate.
- **Custom Maps & Mods:** local `.map` or single-map ZIP import, HaloNet clipboard download, map folder access, campaign character and host match character selection.
- **Match Presets / Faction Teams:** Team SWAT, map-dependent Tower of Power, grenade Dodgeball, Zombies infection and native Race; Covenant/Marines/Flood pairings use map-loaded assets. Race requires track flags. Live preset matches remain unverified.
- **Host profiles V21 / V20 / V11:** selected in the same executable. V11 is multiplayer-only. Native room joins select the advertised profile in-process.
- **Host Match Character:** selects a map-local biped for server-created multiplayer/co-op player units. Missing bipeds retain the map standard. Stock multiplayer maps do not gain campaign assets automatically.

CE609 maps load directly through the native importer. Import owner-supplied `bitmaps.map`, `sounds.map` and `loc.map` companions into `assets/maps/ce` when referenced. OpenSauce `.yelo`, Chimera Lua/DLL and other engine extensions require individual native ports. Classic Halo PC/CE address snapshots stay separately listed and require a classic protocol client. [Supported content and mod path](releases/v0.2.9-steamdeck-content/SUPPORTED-MODS.md); see [native content details](releases/v0.2.9-steamdeck-content/NATIVE-CONTENT.md)..

## Authoritative unified source

[`unified/`](unified) contains the complete unified source snapshot used for this runtime. Its OpenCE base is `76b1898ee14e6fb58e0412acc183da509c10e001`, with the native CE loader, NxHalo characters/lobby, content setup and network profiles reconciled into it. The earlier root source is retained as history.

```sh
cd unified
python3 configure.py --release --portable --pgo=off --lto=thin
ninja linux
```

Use 32-bit SDL3; the build notes describe the SteamOS libm shim. A compatible owner-supplied shader instruction include is required. No game data, instruction tokens, console keys or personal saves are published.

## Verification

Preview 2.9 binary SHA-256: `68e6da65bfd7533d2b13431087b0658e480748057d6e75ca663824956b04da13`. It is atomically installed and running on the Deck; the exact process and destination hashes were verified. Rollback is preserved as `halo.before-content29-20261007`.

The reviewed Deck catalog screen showed a dynamic SEARCH MAPS field, 5,020 matching entries across 558 pages, and populated results. Parser query behavior was unit-tested; physical search input and optional XTest input remain unverified. Native software-GL world probes ran Off/Quality/Performance at 1280x800, but they do not measure Deck performance. A synthetic TGA followed bitmap identity through decode and GL upload, but the captured image did not visibly show the override. Full 128-player acceptance, live preset matches, Friends and voice remain open. [Release notes](releases/v0.2.9-steamdeck-content/release-notes.md) and [native content guide](releases/v0.2.9-steamdeck-content/NATIVE-CONTENT.md).

## Credits and licenses

The Halo decompilation, OpenCE, native ports and bundled libraries retain their authors and licenses. [CREDITS.md](CREDITS.md) records project credits; source-file and library notices govern their respective code. HaloDeck's documentation is CC0. This unofficial fan project is not endorsed by Microsoft, Bungie or Halo Studios.
