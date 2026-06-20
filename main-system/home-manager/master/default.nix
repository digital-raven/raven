# Use this to configure your home environment.
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # Select the pattern you plan on using
    ../../../patterns/REPLACEME_raven-pattern/home-manager.nix

    # Personal
    ./git.nix
    ./gpg.nix
  ];

  home.username = "master";
  home.homeDirectory = "/home/master";

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://mynixos.com/home-manager/option/home.stateVersion
  home.stateVersion = "25.05";
}
