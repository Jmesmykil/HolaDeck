# HaloDeck — Unified native Halo for Steam Deck & Linux

## Current release: Unified Preview 2.8 (pre-release)

[Download the v0.2.8 prerelease](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.8-steamdeck-unified8). It includes the runtime archive, exact source ZIP, supported-mods guide, release notes, manifest and SHA256SUMS. One executable includes campaign, online co-op, native multiplayer, custom CE map setup, host character presets and separate server filters. Earlier releases remain available for rollback.

The creator's main Deck app remains `/home/deck/Games/HaloCE`; its executable, launcher and saves have pre-upgrade backups. Supply your own Xbox maps in `assets/maps`. Launch `launch_halo.sh` natively from Steam, with Proton off. Saves remain `~/.local/share/halo-linux`.

## Main menu

- **Multiplayer:** campaign join/host, multiplayer join/host, all-community discovery and source/version filters. Online campaign uses remote players without a second local controller. Local split-screen remains separate.
- **Custom Maps & Mods:** local `.map` or single-map ZIP import, HaloNet clipboard download, map folder access, campaign character and host match character selection.
- **Match Presets / Faction Teams:** Team SWAT, map-dependent Tower of Power, grenade Dodgeball, Zombies infection and native Race; Covenant/Marines/Flood pairings use map-loaded assets. Race requires track flags. Live preset matches remain unverified.
- **Host profiles V21 / V20 / V11:** selected in the same executable. V11 is multiplayer-only. Native room joins select the advertised profile in-process.
- **Host Match Character:** selects a map-local biped for server-created multiplayer/co-op player units. Missing bipeds retain the map standard. Stock multiplayer maps do not gain campaign assets automatically.

CE609 maps load directly through the native importer. Import owner-supplied `bitmaps.map`, `sounds.map` and `loc.map` companions into `assets/maps/ce` when referenced. OpenSauce `.yelo`, Chimera Lua/DLL and other engine extensions require individual native ports. Classic Halo PC/CE address snapshots stay separately listed and require a classic protocol client. [Supported content and mod path](releases/v0.2.8-steamdeck-unified8/SUPPORTED-MODS.md).

## Authoritative unified source

[`unified/`](unified) contains the complete unified source snapshot used for this runtime. Its OpenCE base is `76b1898ee14e6fb58e0412acc183da509c10e001`, with the native CE loader, NxHalo characters/lobby, content setup and network profiles reconciled into it. The earlier root source is retained as history.

```sh
cd unified
python3 configure.py --release --portable --pgo=off --lto=thin
ninja linux
```

Use 32-bit SDL3; the build notes describe the SteamOS libm shim. A compatible owner-supplied shader instruction include is required. No game data, instruction tokens, console keys or personal saves are published.

## Verification

The final Linux executable is installed on the Deck and the file hash is verified; the already-running game process remains on 5baaae until the next launch. Runtime dialog redraw and a clean world frame were verified, but stock modal styling has not received human physical acceptance. Controller routing selects one controller, favors directly connected PlayStation controllers over built-in Deck controls, and preserves split-screen assignments. Held menu navigation repeats at 350ms. The creator confirmed PS5 gameplay and menu controls on the e09 controller build. The latest package retains that input source. Runtime dialog redraw is present; physical human acceptance of stock modal styling remains open. Physical captures show the new content/network menus; map archive fixtures and native linking passed. A reproduced keepalive stack overwrite was fixed with bounded packet scratch storage and independently reviewed. Private hosts initialized under all three profiles after the fix, but synthetic joins did not succeed. Death Island reached native gameplay on Omarchy with owner-supplied CE resources. Sustained two-client interoperability, alternate-character matches, full download/join and controller moderation remain unverified. Friends and voice remain future work. [Release notes](releases/v0.2.8-steamdeck-unified8/release-notes.md).

## Credits and licenses

The Halo decompilation, OpenCE, native ports and bundled libraries retain their authors and licenses. [CREDITS.md](CREDITS.md) records project credits; source-file and library notices govern their respective code. HaloDeck's documentation is CC0. This unofficial fan project is not endorsed by Microsoft, Bungie or Halo Studios.
