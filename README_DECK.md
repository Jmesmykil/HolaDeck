# Steam Deck / Linux player guide

The latest feature build is [NxHalo Steam Deck Preview 2.4 / v0.2.4](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.4-steamdeck-preview4), a native 32-bit Linux build on network protocol 11. It adds confirmed host Kick/Ban Console actions to the selected-player lobby and retains public online/cross-console/browser discovery, Co-op Campaign, a 128-entry scrollable roster, responsive panels and opt-in Custom Edition map download-and-join from the HaloNet map catalog.

NxHalo Setup generates the same original 320x240 NXHALO loading image for the user-prepared `maps/loading.tga` folder used by the Switch package. The Steam Deck package includes the matching NxHalo app icons; the loading image is created locally by the setup app, and no game data or console keys are redistributed.

## Install

1. Download `NxHalo-SteamDeck-preview2.4.tar.gz` from the Preview 2.4 release and extract it to a writable folder on the Deck.
2. Put your own supported Halo CE `maps` folder, including `shaders.bin` and `loading.tga`, under `assets/maps`. No game content or keys are included.
3. Launch `launch_halo.sh` directly or add it to Steam as a non-Steam game. Do not force Proton; this is a native Linux build. SDL3 is bundled.
4. On Wi-Fi, SteamOS Developer Mode offers a Wi-Fi Power Management toggle that can improve local packet timing.

## Lobby controls

The waiting lobby shows mode, map, capacity, status, and all roster entries through scrolling. Select a remote player to inspect their name, team, slot and console. Hosts can select **KICK CONSOLE** or **BAN CONSOLE**, then confirm the same action for that console. In Join Game, choose **GET MAP & JOIN** for an eligible missing catalogued Custom Edition map; the client verifies the downloaded archive and CRC before joining. Arbitrary file URLs and other mod types are not supported in this preview.

The current practical match-size estimate is roughly 40 players. The 128-entry roster display does not mean 128-player matches are tested. Preview 2.4 was built on Omarchy Linux and installed at the existing Steam Deck game path. Lobby actions, other resolutions, real matches and in-game map downloads remain for owner verification. Friends/follow, voice setup and proximity chat are later work and are not included. See the release notes for limitations.

Saved games: `~/.local/share/halo-linux` (or `HALO_SAVE_ROOT`). Settings: `config.toml` next to the program.
