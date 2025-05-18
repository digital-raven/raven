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
    ./games.nix
    ./launchers.nix
    ./social.nix
  ];
}
