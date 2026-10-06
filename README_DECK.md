# Steam Deck / Linux player guide

The latest feature build is [NxHalo Steam Deck Preview 2.3 / v0.2.3](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.3-steamdeck-preview3), a native 32-bit Linux build on network protocol 11. It adds selected-player inspection to the lobby roster and retains public online/cross-console browsing, Co-op Campaign, a 128-entry scrollable roster, responsive panels and opt-in Custom Edition map download-and-join.

NxHalo Setup generates the same original 320x240 NXHALO loading image for the user-prepared `maps/loading.tga` folder used by the Switch package. The Steam Deck package includes the matching NxHalo app icons; the loading image is created locally by the setup app, and no game data or console keys are redistributed.

## Install

1. Download `NxHalo-SteamDeck-preview2.3.tar.gz` from the Preview 2.3 release and extract it to a writable folder on the Deck.
2. Put your own supported Halo CE `maps` folder, including `shaders.bin` and `loading.tga`, under `assets/maps`. No game content or keys are included.
3. Launch `launch_halo.sh` directly or add it to Steam as a non-Steam game. Do not force Proton; this is a native Linux build. SDL3 is bundled.
4. On Wi-Fi, SteamOS Developer Mode offers a Wi-Fi Power Management toggle that can improve local packet timing.

## Lobby controls

The waiting lobby shows mode, map, capacity, status, and the full player roster through scrolling. In Join Game, choose **GET MAP & JOIN** for an eligible missing Custom Edition map; the client checks the downloaded map archive and CRC before it joins.

The current practical match-size estimate is roughly 40 players. The 128-entry roster display does not mean 128-player matches are tested. Preview 2.3 was installed on SteamOS 3.8.28 and process-smoked for 12 seconds; logs reached main-menu music and frame 626, but visible output is not verified. Lobby interaction, other resolutions, real matches and in-game map downloads remain untested. See the release notes for limitations.

Saved games: `~/.local/share/halo-linux` (or `HALO_SAVE_ROOT`). Settings: `config.toml` next to the program.
