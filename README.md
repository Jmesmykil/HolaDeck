## Current Steam Deck/Linux update: 2.9.4 native voice foundation

[Download runtime and matching source](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.9.4-steamdeck-runtime-nativevoice1). Executable SHA-256: `4a083770b6920d2a1f7372ba701967bcf02b840e0d2c3e9bfe7d55bf646964c0`. This exact build is installed on the Steam Deck.

Adds default-OFF compatible-native proximity voice with authenticated joined-player routing, spatial mixing, push-to-talk V/X/C, and expiry after release. Audio Settings spinner arrow hitboxes now match their drawn controls; click OK to save. Compatible native clients are required for voice; unchanged clients and the Switch runtime do not gain voice from this release.

Exact candidate passed a private Deck GPU multiplayer session with a native Linux peer. Two actual native clients passed generated-PCM capture-to-encrypted-transport-to-spatial-mixer testing with dummy audio and waveform analysis: 605 frames received/mapped, zero mapping drops, no sender loopback, and expiry after PTT release. Actual menu writes and fresh-process reload passed. No physical microphone or external audio was used.

Retains confirmed controller fixes, map download/autojoin, match customization and co-op lifecycle fixes. Voice is still a foundation: physical microphone/human PTT, persistent Friends, natural campaign completion, physical Switch acceptance and real 128-player capacity remain open. The mixer has 16 active stream slots; the tunnel rate budget is roughly five continuously transmitting speakers, not 128-person voice. [Release evidence](releases/v0.2.9.4-steamdeck-runtime-nativevoice1/release-notes.md).

# HaloDeck — Unified native Halo for Steam Deck & Linux

## Previous co-op lifecycle release (retained evidence)

[Download co-op lifecycle update](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.9.4-steamdeck-runtime-coopfix1). Runtime SHA-256: `05fb520d15722a1954dcd884702ebff49dddc59b1aada4b39f6770ac8fdefed0`. The unified native executable retains campaign, online co-op and multiplayer profiles 11/20/21 (V11 is multiplayer-only), CE catalog search/download, native texture packs, Deck rendering profiles, cached presets, controller navigation, and custom-map download/autojoin. The exact candidate is installed and running from the original Steam shortcut on Deck. Actual two-native-process tests exercised pause-menu Restart/Revert. Checkpoint creation and mission-win-to-next-map transitions were synthetic; a separate natural Start flow loaded B30 on both peers, with the client spectating the intro. This does not claim mission completion.

The prior 64761 build recorded a 65-second two-player Bloodgulch Quality session that measured 59.70 fps across four post-load intervals, wall p95 16.825–16.864 ms, p99 16.909–16.949 ms, RSS 210136 KiB (peak 238484 KiB). This is one map/mode/player-count sample. Real 128-player matches, Persistent Friends and physical microphone voice acceptance and broad legacy-client interoperability remain unverified. See [release evidence](releases/v0.2.9.4-steamdeck-runtime/VERIFICATION-EVIDENCE.md), [native content guide](releases/v0.2.9.4-steamdeck-runtime/NATIVE-CONTENT.md), and [supported-mods guide](releases/v0.2.9.4-steamdeck-runtime/SUPPORTED-MODS.md).

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

The 65-second Deck performance capture above used 2.9.4. Earlier 0f6 tests covered two CE catalog map downloads and a two-client Zombies end-round; separate 5ecb/4dd54 tests covered the 128-slot synthetic roster and visible synthetic texture override. Those checks are pinned to predecessor hashes in the release evidence. Synthetic peers do not establish 128 real users. Physical controller search, full campaign completion, Persistent Friends, physical microphone voice acceptance and broad legacy interoperability remain unverified.

## Credits and licenses

The Halo decompilation, OpenCE, native ports and bundled libraries retain their authors and licenses. [CREDITS.md](CREDITS.md) records project credits; source-file and library notices govern their respective code. HaloDeck's documentation is CC0. This unofficial fan project is not endorsed by Microsoft, Bungie or Halo Studios.


**Additional validation, October 8:** Three actual native campaign clients joined and remained alive. Host relayed 606 generated voice frames; the third client received and spatially mixed 596 with zero player-mapping drops. Both receivers passed waveform signal and PTT-expiry checks; the sender had no loopback. All six owned game/display processes exited cleanly. This is a private generated-PCM test, not physical microphone or capacity acceptance. [Metrics](releases/v0.2.9.4-steamdeck-runtime-nativevoice1/THREE-CLIENT-VOICE.json).
