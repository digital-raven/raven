# This waybar config relies on some extra programs.
{
  config,
  pkgs,
  ...
}: let
  pkgs_waybar_0_12_0 =
    import (pkgs.fetchFromGitHub {
      owner = "nixos";
      repo = "nixpkgs";
      rev = "7282cb574e0607e65224d33be8241eae7cfe0979";
      hash = "sha256-hYKMs3ilp09anGO7xzfGs3JqEgUqFMnZ8GMAqI6/k04=";
    }) {
      inherit (pkgs) system;
    };
in {
  # Specific version of waybar
  programs.waybar = {
    enable = true;
    package = pkgs_waybar_0_12_0.waybar;
  };

  # Brightness and audio control
  home.packages = with pkgs; [
    # Regular packages
    brightnessctl
    pamixer
    pulseaudio # Installs pactl
  ];

  services.playerctld.enable = true;

  home.file = {
    ".config/waybar" = {
      source = ./dotfiles/waybar;
      recursive = true;
    };
  };
}
