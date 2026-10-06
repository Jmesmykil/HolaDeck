# Steam Deck / Linux player guide

The latest feature build is [NxHalo Steam Deck Preview 2.2 / v0.2.2](https://github.com/Jmesmykil/HolaDeck/releases/tag/v0.2.2-steamdeck-preview2), a native 32-bit Linux build on network protocol 11. It includes public online and cross-console lobby browsing, **Co-op Campaign**, campaign character selection, a resolution-aware waiting lobby, a scrollable roster with up to 128 display entries, and opt-in download-and-join for missing Custom Edition maps.

## Install

1. Download `NxHalo-SteamDeck-preview2.2.tar.gz` from the Preview 2.2 release and extract it to a writable folder on the Deck.
2. Put your own supported Halo CE `maps` folder, including `shaders.bin` and `loading.tga`, under `assets/maps`. No game content or keys are included.
3. Launch `launch_halo.sh` directly or add it to Steam as a non-Steam game. Do not force Proton; this is a native Linux build. SDL3 is bundled.
4. On Wi-Fi, SteamOS Developer Mode offers a Wi-Fi Power Management toggle that can improve local packet timing.

## Lobby controls

The waiting lobby shows mode, map, capacity, status, and the full player roster through scrolling. In Join Game, choose **GET MAP & JOIN** for an eligible missing Custom Edition map; the client checks the downloaded map archive and CRC before it joins.

The current practical match-size estimate is roughly 40 players. The 128-entry roster display does not mean 128-player matches are tested. The Preview 2.2 process ran on SteamOS 3.8.28 through frame 5400 with clean render-health logs. The available X11 capture showed a black frame, so visible output and reaching the main menu remain unverified. It has not been hand-played or tested in a lobby, at other resolutions, or with a real map download. See the release notes for limitations.

Saved games: `~/.local/share/halo-linux` (or `HALO_SAVE_ROOT`). Settings: `config.toml` next to the program.
