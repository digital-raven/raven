# Edit this file to add remove users from home-manager.
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  # Add new users to home manager by creating a "default.nix" file
  # under a folder in this directory named after their username
  # and copy the line below.
  home-manager.users.master = import ./master;

  #home-manager.users.guest = import ./guest;
}
