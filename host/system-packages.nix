# Modify this file to install extra off-the-shelf system-wide packages.

{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {

  # Packages. Every system should have git and vim
  environment.systemPackages = with pkgs; [
    git
    vim
  ];

}
