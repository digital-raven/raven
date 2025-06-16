# home-manager configuration file for guest
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

    # You can also split up your configuration and import pieces of it here:
    ../../../patterns/raven-terminal/home-manager/bash.nix
    ../../../patterns/raven-terminal/home-manager/nvim.nix
    ../../../patterns/raven-terminal/home-manager/vim.nix
  ];

  # EDIT_ username and homeDirectory when copying this file to create a new user.
  home = {
    username = "guest";
    homeDirectory = "/home/guest";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://mynixos.com/home-manager/option/home.stateVersion
  home.stateVersion = "25.05";
}
