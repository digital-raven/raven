# Configure hyprlock
{pkgs, ...}: {
  programs.hyprlock.enable = true;

  home.file = {
    ".config/hypr/hyprlock.conf" = {
      source = ./dotfiles/hyprlock/hyprlock.conf;
    };
    ".config/hypr/assets " = {
      source = ./dotfiles/hyprlock/assets;
      recursive = true;
    };
  };
}
