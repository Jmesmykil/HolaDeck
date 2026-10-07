# HaloDeck — Native Halo CE for Steam Deck & Linux

This repository contains the full source snapshot used for the NxHalo Steam Deck build, its tools and launcher. Supply compatible maps from your own Xbox Halo game. Game data, console keys, shader instruction tokens and personal saves are excluded.

## Current releases

**NxHalo Preview 2.6 / v0.2.6, network protocol 11.** Download [the release](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.6-steamdeck-preview6), including `NxHalo-SteamDeck-preview2.6.tar.gz`, matching source, manifest and checksums. The Xbox main menu and character flow now reach the responsive network lobby. The lobby follows the window shape, shows the full game mode, player details and a scrollable 128-entry roster. A selected remote console can be kicked or banned with confirmation. Custom-map ZIP import supports safe nested entries and verifies size, deflate completion and CRC.

**Community online campaign: OpenCE, network protocol 21.** The same release includes its runtime and exact source, plus the legacy V11-20 compatibility client. The network chooser provides campaign join/host without a second controller. Saves are isolated. Use NxHalo for existing protocol-11 Switch/native/browser rooms.

The Switch [Profile33 / v0.1.11-p33](https://github.com/Jmesmykil/NxHalo-Releases/releases/tag/v0.1.11-p33) remains the published protocol-11 Switch build. Earlier Steam Deck previews remain available for rollback.

## Server discovery and online campaign

Preview 2.6 separates **JOIN CAMPAIGN LOBBIES**, **HOST ONLINE CAMPAIGN**, **MULTIPLAYER SERVERS**, and **ALL COMMUNITY SERVERS**. Online campaign does not require a second local controller; local split-screen remains a separate option. NxHalo's Multiplayer > ONLINE CAMPAIGN opens the installed OpenCE component.

Source/version filters keep current V21, legacy V11-20, broker-published, community-announced, classic Halo CE, and classic Halo PC listings separate. The live directory refreshes every ten seconds alongside all four upstream brokers. Native legacy invites launch the sibling `Chupathingy-Legacy` client included in the release. Extract it beside `OpenCE-Campaign` and the NxHalo runtime.

Classic master snapshots contain 253 CE and 97 PC addresses from October 6, 2026. They are listed separately with unknown player counts and activity; joining them requires a classic client. These are all discovered public sources, not a claim to enumerate private or unpublished servers.

The installed Deck build displayed active native rooms and reached live multiplayer gameplay. Final campaign routing and classic-client feedback are installed for the next launch; a two-player campaign run and a legacy real-match handoff remain unverified. Friends/follow and proximity voice remain unimplemented.

## Installation

1. Extract the selected runtime and supply your compatible Xbox maps in `assets/maps/`.
2. Add `launch_halo.sh` as a non-Steam game and launch natively; disable Proton.
3. Keep NxHalo and OpenCE in separate folders. NxHalo uses `~/.local/share/halo-linux`; OpenCE uses `~/.local/share/opence-campaign`.

Both runtimes are installed on the creator's Deck, and their executable hashes were verified. The original NxHalo executable and launcher have local rollback copies.

## Verification

Physical Deck captures show the full-width waiting lobby at 1920x1080 and **128/128 synthetic lobby players**. OpenCE launched to its main menu. Seven independent map archive fixtures passed, and an independent source review found no blocking issue. These checks do not establish a 128-player battle, controller scrolling/moderation, in-game internet map-download/join or a two-player campaign run. See the [release notes](releases/v0.2.6-steamdeck-preview6/release-notes.md) for precise acceptance limits. Friends/follow and proximity voice remain future work.

## Building NxHalo

Install Python, Ninja, Clang/LLD, 32-bit glibc development files and **32-bit** SDL3 development files. Build directly from this repository:

```sh
git clone https://github.com/Jmesmykil/HolaDeck.git
cd HolaDeck
python3 configure.py --release --portable --pgo=off --game-browser
ninja linux
```

The executable is `build/linux/halo`. If the host only has a 64-bit system SDL3, the final link needs an explicit `-L` directory containing 32-bit SDL3. The release notes record the Omarchy build. The historical `halodeck.patch` is retained as a reference; it is not required for this source snapshot. [RELEASE-SOURCE.md](RELEASE-SOURCE.md) describes source provenance and the owner-supplied data needed to build/run. The OpenCE source archive records its separate protocol-21 build and SteamOS libm compatibility shim.

## Credits

HaloDeck is built on the Halo decompilation started by punpckhdq and continued by bnunu, on MrBruh's native ports, and on the work of Jonas Volman and everyone else who contributed to them. [CREDITS.md](CREDITS.md) lists them all, with the libraries the port uses.

## License

HaloDeck's own files (this guide, the credits and the patch) are released under CC0 1.0: see [LICENSE.md](LICENSE.md). halo-ce-universal and the libraries it uses have their own licenses.

Halo: Combat Evolved was developed by Bungie and published by Microsoft. HaloDeck is an unofficial fan project, not affiliated with or endorsed by Microsoft, Xbox Game Studios, Halo Studios or Bungie. Halo, Xbox and Microsoft are trademarks of the Microsoft group of companies.
