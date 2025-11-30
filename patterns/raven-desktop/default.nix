{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hyprland/default.nix
    ./packages.nix

    # Active system-level attachments.
    ./attachments/system.nix
  ];
}
