{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./kde.nix
    ./packages.nix
  ];
}
