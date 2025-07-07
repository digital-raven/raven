# Modify this file to install extra off-the-shelf system-wide packages.
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # Install new packages here.
  environment.systemPackages = with pkgs; [
    git
    vim
  ];
}
