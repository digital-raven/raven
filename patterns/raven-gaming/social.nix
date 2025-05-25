# Gaming-oriented social packages.
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
  ];

  # Packages
  environment.systemPackages = with pkgs; [
    discord
  ];
}
