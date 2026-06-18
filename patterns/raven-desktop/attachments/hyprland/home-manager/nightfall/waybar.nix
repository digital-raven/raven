# This waybar config relies on some extra programs.
{pkgs, ...}: {
  programs.waybar.enable = true;

  # Brightness and audio control
  home.packages = with pkgs; [
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
