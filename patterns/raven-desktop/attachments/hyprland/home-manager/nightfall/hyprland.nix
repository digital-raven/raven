# Theme-specific hyprland settings.
{pkgs, ...}: {
  # Some basic desktop tools
  home.packages = with pkgs; [
    nautilus # File explorer
    grimblast # Screenshot
    hyprpicker # Color picker

    # Hyprland plugins
    hyprlandPlugins.hypr-dynamic-cursors
    hyprlandPlugins.hyprspace
  ];

  # hyprland.conf needs to load the plugins
  wayland.windowManager.hyprland = {
    extraConfig = ''
      exec-once = hyprctl plugin load ${pkgs.hyprlandPlugins.hypr-dynamic-cursors.outPath}/lib/libhypr-dynamic-cursors.so
      exec-once = hyprctl plugin load ${pkgs.hyprlandPlugins.hyprspace.outPath}/lib/libhyprspace.so
      source = hyprland-main.conf
      source = hypr-dynamic-cursors.conf
    '';
  };

  # Copy over dotfiles
  home.file = {
    ".config/hypr" = {
      source = ./dotfiles/hypr;
      recursive = true;
    };
  };
}
