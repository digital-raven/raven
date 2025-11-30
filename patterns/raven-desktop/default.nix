{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hyprland.nix
    ./packages.nix

    # Active system-level attachments.
    ./attachments/system.nix
  ];
}
