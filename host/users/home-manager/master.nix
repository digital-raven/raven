# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
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
    # If you want to use modules your own flake exports (from shared/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # REPLACEME_ Uncomment a pattern below and delete this line.
    # Uncoment the pattern you're using
    #../../../patterns/raven-terminal/home-manager/default.nix
    #../../../patterns/raven-home/home-manager/default.nix
    #../../../patterns/raven-gaming/home-manager/default.nix

    # Personal
    ./master/git.nix
    ./master/gpg.nix
  ];

  home.username = "master";
  home.homeDirectory = "/home/master";

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://mynixos.com/home-manager/option/home.stateVersion
  home.stateVersion = "25.05";
}
