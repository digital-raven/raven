{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./packages.nix
  ];

  # Allow unfree software
  nixpkgs.config.allowUnfree = true;
}
