# HaloDeck — Unified native Halo for Steam Deck & Linux

## Current release: Unified Rules Preview 2.9.3 (pre-release)

[Download v0.2.9.3](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.9.3-steamdeck-rules). This release updates cached match presets, protects host-selected modes from clients, exposes replicated rule values in lobbies, and enforces host-side infection melee/loadout behavior. Harness/UI checks passed; old-client skull behavior and broad legacy interoperability remain unverified. Previous 2.9.x releases remain available.

[Download the v0.2.9.2 prerelease](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.9.2-steamdeck-menus). It adds organized multiplayer/game-mode menus, a saved game-type editor, and map-aware Zombies sword handling. Previous 2.9 and 2.9.1 releases remain available.

[Download the v0.2.9.1 hotfix](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.9.1-steamdeck-content). It fixes activation for existing texture-pack rows. The feature release [v0.2.9](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.9-steamdeck-content) remains available with its runtime/source package and full content notes.

[Download the v0.2.9 prerelease](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.9-steamdeck-content). It includes the runtime archive, unified source snapshot, native content guide, supported-mods guide, release notes, manifest and SHA256SUMS. The one native executable includes a live CE map catalog, texture-pack overrides and Deck-gated Off/Quality/Performance rendering alongside campaign, online co-op and multiplayer. Previews 2.8 and 2.8.1 remain available for rollback.

Menu routes: Multiplayer → Join/Create/Local Split/Edit Game Types; Create Game → Game Modes (Combat/Factions/Race/Standard) or Network Options; Custom Maps & Mods → Custom Maps → Browse; Characters remains separate. The editor saves game types, weapons, players, vehicles and scoring. Zombies uses a sword only when the selected map contains the required loaded tag/assets; missing content refuses infection and preserves inventory.

The creator's main Deck app remains `/home/deck/Games/HaloCE`; its executable, launcher and saves have pre-upgrade backups. Supply your own Xbox maps in `assets/maps`. Launch `launch_halo.sh` natively from Steam, with Proton off. Saves remain `~/.local/share/halo-linux`.

## Main menu

- **Multiplayer:** campaign join/host, multiplayer join/host, all-community discovery and source/version filters. Online campaign uses remote players without a second local controller. Local split-screen remains separate.
- **Custom Maps & Mods:** local `.map` or single-map ZIP import, HaloNet clipboard download, map folder access, campaign character and host match character selection.
- **Match Presets / Faction Teams:** Team SWAT, map-dependent Tower of Power, grenade Dodgeball, Zombies infection and native Race; Covenant/Marines/Flood pairings use map-loaded assets. Race requires track flags. Live preset matches remain unverified.
- **Host profiles V21 / V20 / V11:** selected in the same executable. V11 is multiplayer-only. Native room joins select the advertised profile in-process.
- **Host Match Character:** selects a map-local biped for server-created multiplayer/co-op player units. Missing bipeds retain the map standard. Stock multiplayer maps do not gain campaign assets automatically.

CE609 maps load directly through the native importer. Import owner-supplied `bitmaps.map`, `sounds.map` and `loc.map` companions into `assets/maps/ce` when referenced. OpenSauce `.yelo`, Chimera Lua/DLL and other engine extensions require individual native ports. Classic Halo PC/CE address snapshots stay separately listed and require a classic protocol client. [Supported content and mod path](releases/v0.2.9.2-steamdeck-menus/SUPPORTED-MODS.md); see [native content details](releases/v0.2.9-steamdeck-content/NATIVE-CONTENT.md)..

## Authoritative unified source

[`unified/`](unified) contains the complete unified source snapshot used for this runtime. Its OpenCE base is `76b1898ee14e6fb58e0412acc183da509c10e001`, with the native CE loader, NxHalo characters/lobby, content setup and network profiles reconciled into it. The earlier root source is retained as history.

```sh
cd unified
python3 configure.py --release --portable --pgo=off --lto=thin
ninja linux
```

Use 32-bit SDL3; the build notes describe the SteamOS libm shim. A compatible owner-supplied shader instruction include is required. No game data, instruction tokens, console keys or personal saves are published.

## Verification

Preview 2.9.2 binary SHA-256: `03a94e8d49c3533807c478ba2a3390080db8f74b8b1a207b31510efa2882c84b`. The 2.9.2 executable is atomically installed on the Deck with exact hash verified. The user’s public match remains live on prior process PID 579445 (hash `84336f0f5394a53ea9d8ff6fc8b1e350c6709feb7aa967d378915b9ff3003918`) until relaunch; rollback is preserved as `halo.before-menus292-20261007`. Rollback is preserved as `halo.before-content29-20261007`.

The reviewed Deck catalog screen showed a dynamic SEARCH MAPS field, 5,020 matching entries across 558 pages, and populated results. Parser query behavior was unit-tested; physical search input and optional XTest input remain unverified. Native software-GL world probes ran Off/Quality/Performance at 1280x800, but they do not measure Deck performance. A synthetic TGA followed bitmap identity through decode and GL upload, but the captured image did not visibly show the override. Full 128-player acceptance, live preset matches, Friends and voice remain open. [Hotfix notes](releases/v0.2.9.1-steamdeck-content/release-notes.md) and [native content guide](releases/v0.2.9-steamdeck-content/NATIVE-CONTENT.md).

## Credits and licenses

The Halo decompilation, OpenCE, native ports and bundled libraries retain their authors and licenses. [CREDITS.md](CREDITS.md) records project credits; source-file and library notices govern their respective code. HaloDeck's documentation is CC0. This unofficial fan project is not endorsed by Microsoft, Bungie or Halo Studios.
