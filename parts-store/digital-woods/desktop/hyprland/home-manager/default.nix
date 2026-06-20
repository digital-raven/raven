# Raven keeps all hyprland modifications scoped in home-manager.
# This is done through themes.
#
# A theme is responsible for all reliant programs and configuration files.
#
# eg. If your theme has a waybar configuration, then it should be
#     responsible for waybar's installation as well.
#
# This makes it easy to keep a theme portable. It also allows switching
# themes using home manager instead of an entire system rebuild.
#
{pkgs, ...}: {
  # Import a theme.
  imports = [
    ./nightfall/default.nix
  ];

  # Enable Hyprland.
  wayland.windowManager.hyprland = {
    enable = true;
  };
}
