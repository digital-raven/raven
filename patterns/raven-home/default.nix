{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./xfce.nix
    ./packages.nix
  ];
}
