# Steam Deck Preview 2.5

The Xbox main menu and character flow now reach the responsive network lobby.
The lobby follows the actual window shape, fixes the mode label, and shows remote
console moderation actions only when a remote player is selected. Custom-map
ZIP imports accept safe nested map entries and reject traversal, duplicates,
encryption, unsupported ZIP64, size mismatches, incomplete streams and CRC errors.

NxHalo uses network protocol 11. The separate OpenCE campaign download uses
protocol 21, with upstream online campaign synchronization and public/private
lobbies. It retains an isolated save root and is installed beside NxHalo.

Verified on the physical Deck: wide lobby pixels captured at 1920x1080;
128/128 synthetic lobby players visible; native main-menu launch for OpenCE.
Seven independent ZIP fixtures passed; an independent source review found no
blocking issue. A 128-player live battle, controller scrolling/moderation,
in-game internet map-download/join, and two-player campaign gameplay are not
verified by those checks. Friends/follow and proximity voice remain future work.

No game data, console keys or personal saves are included. Existing releases
remain available for rollback. The installed NxHalo executable and launcher
also have local backups on the Deck.
