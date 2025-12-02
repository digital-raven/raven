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
    ./raven-hyprland.nix
  ];
}
