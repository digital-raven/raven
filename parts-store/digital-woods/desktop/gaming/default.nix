# The gaming attachment contains popular emulators, launchers, and accessory
# software for a gaming PC.
#
# Almost all video-games are unfree software. Even the "free" software of this
# attachment is used to launch unfree video-games.
#
# The best gamers can really hope for on this front are DRM free games (GOG)
# and emulation with archived ROMs.
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./emulators.nix
    ./launchers.nix
  ];
}
