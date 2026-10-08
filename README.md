## Current additive runtime update

The current native Linux runtime is the additive **v0.2.9.4 editor stability update**. Download the [runtime and matching filtered source snapshot](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.9.4-steamdeck-runtime-editfix1). Runtime SHA-256: `64761e21783c861123469b8827716690843d878b98e674252edfbe24043f080d`. The matching source is mirrored in [`unified/`](unified) and its release asset SHA-256 is `9b318a3037cb41a986d78323867f1aff05306d171a03c92d239fbce10b096ead`. This update fixes playlist/profile initialization synchronization and Linux file-enumeration handle lifecycle. It does not include game data, maps, saves, keys, or resource files. See [release notes](releases/v0.2.9.4-steamdeck-runtime-editfix1/release-notes.md) and [verification limits](releases/v0.2.9.4-steamdeck-runtime-editfix1/VERIFICATION-EVIDENCE.md).

# HaloDeck — Unified native Halo for Steam Deck & Linux

## Current release: Unified Runtime Preview 2.9.4 (pre-release)

[Download v0.2.9.4](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.9.4-steamdeck-runtime). Runtime SHA-256: `8335b4f246b592854a91916bb36141c884883eb197eff1f5e59e4fe78aae64fc`. One native executable includes campaign, online co-op and multiplayer profiles 11/20/21 (V11 is multiplayer-only), CE catalog search/download, native texture packs, Deck Off/Quality/Performance rendering and cached match-rule presets. A private two-player V21 `a50` test confirmed host/client movement agreement; it does not prove campaign completion. The exact build is installed and running from the original Steam shortcut on Deck.

A 65-second two-player Bloodgulch Quality session on this build measured 59.70 fps across four post-load intervals, wall p95 16.825–16.864 ms, p99 16.909–16.949 ms, RSS 210136 KiB (peak 238484 KiB). This is one map/mode/player-count sample. Real 128-player matches, Friends/voice and broad legacy-client interoperability remain unverified. See [release evidence](releases/v0.2.9.4-steamdeck-runtime/VERIFICATION-EVIDENCE.md), [native content guide](releases/v0.2.9.4-steamdeck-runtime/NATIVE-CONTENT.md), and [supported-mods guide](releases/v0.2.9.4-steamdeck-runtime/SUPPORTED-MODS.md).

Earlier 2.9.3 rules, 2.9.2 menus, 2.9.1 content hotfix and 2.9 content releases remain available. Previous 2.8 and 2.8.1 builds remain available for rollback.

Menu routes: Multiplayer → Join/Create/Local Split/Edit Game Types; Create Game → Game Modes (Combat/Factions/Race/Standard) or Network Options; Custom Maps & Mods → Custom Maps → Browse; Characters remains separate. The editor saves game types, weapons, players, vehicles and scoring. Zombies melee uses a sword on maps with the required loaded tag/assets and falls back to stock Oddball melee otherwise. Map-dependent visuals and loadouts remain bounded; failed loadout grants preserve inventory. A two-client Zombies end-round was verified on predecessor 0f6, but other presets have not been broadly tested in live matches.

The creator's main Deck app remains `/home/deck/Games/HaloCE`; its executable, launcher and saves have pre-upgrade backups. Supply your own Xbox maps in `assets/maps`. Launch `launch_halo.sh` natively from Steam, with Proton off. Saves remain `~/.local/share/halo-linux`.

## Main menu

- **Multiplayer:** campaign join/host, multiplayer join/host, all-community discovery and source/version filters. Online campaign uses remote players without a second local controller. Local split-screen remains separate.
- **Custom Maps & Mods:** local `.map` or single-map ZIP import, HaloNet clipboard download, map folder access, campaign character and host match character selection.
- **Match Presets / Faction Teams:** Team SWAT, map-dependent Tower of Power, grenade Dodgeball, Zombies infection and native Race; Covenant/Marines/Flood pairings use map-loaded assets. Race requires track flags. A bounded two-client Zombies end-round was verified on predecessor 0f6; other presets have not been broadly tested in live matches.
- **Host profiles V21 / V20 / V11:** selected in the same executable. V11 is multiplayer-only. Native room joins select the advertised profile in-process.
- **Host Match Character:** selects a map-local biped for server-created multiplayer/co-op player units. Missing bipeds retain the map standard. Stock multiplayer maps do not gain campaign assets automatically.

CE609 maps load directly through the native importer. Import owner-supplied `bitmaps.map`, `sounds.map` and `loc.map` companions into `assets/maps/ce` when referenced. OpenSauce `.yelo`, Chimera Lua/DLL and other engine extensions require individual native ports. Classic Halo PC/CE address snapshots stay separately listed and require a classic protocol client. [Supported content and mod path](releases/v0.2.9.4-steamdeck-runtime/SUPPORTED-MODS.md); see [native content details](releases/v0.2.9.4-steamdeck-runtime/NATIVE-CONTENT.md).

## Authoritative unified source

[`unified/`](unified) contains the complete unified source snapshot used for this runtime. Its OpenCE base is `76b1898ee14e6fb58e0412acc183da509c10e001`, with the native CE loader, NxHalo characters/lobby, content setup and network profiles reconciled into it. The earlier root source is retained as history.

```sh
cd unified
python3 configure.py --release --portable --pgo=off --lto=thin
ninja linux
```

Use 32-bit SDL3; the build notes describe the SteamOS libm shim. A compatible owner-supplied shader instruction include is required. No game data, instruction tokens, console keys or personal saves are published.

## Verification

The exact 2.9.4 executable SHA-256 is `8335b4f246b592854a91916bb36141c884883eb197eff1f5e59e4fe78aae64fc`; Deck destination/readback and running-process hashes match. A natural V21 campaign browser session loaded `a50`; a three-second client movement input produced an agreeing host position. This verifies movement/state agreement in the loaded mission, not a completed campaign.

The 65-second Deck performance capture above used 2.9.4. Earlier 0f6 tests covered two CE catalog map downloads and a two-client Zombies end-round; separate 5ecb/4dd54 tests covered the 128-slot synthetic roster and visible synthetic texture override. Those checks are pinned to predecessor hashes in the release evidence. Synthetic peers do not establish 128 real users. Physical controller search, full campaign completion, Friends, voice and broad legacy interoperability remain unverified.

## Credits and licenses

The Halo decompilation, OpenCE, native ports and bundled libraries retain their authors and licenses. [CREDITS.md](CREDITS.md) records project credits; source-file and library notices govern their respective code. HaloDeck's documentation is CC0. This unofficial fan project is not endorsed by Microsoft, Bungie or Halo Studios.
