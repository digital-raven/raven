# Theme-specific hyprland settings.
{pkgs, ...}: {
  imports = [
    ./keybindings.nix
    ./monitors.nix
    ./plugins.nix
    ./window-behavior.nix
  ];

  # Some basic desktop tools. These are referenced in keybindings.nix
  home.packages = with pkgs; [
    nautilus # File explorer
    grimblast # Screenshot
    hyprpicker # Color picker
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec-once = [
        "waybar" # This launches the bar at the top.
        "swww-daemon" # swww is for wallpaper management.
        "hypridle" # Idle daemon.
      ];

      # See https://wiki.hyprland.org/Configuring/Environment-variables/
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"

        # XDG Specifications
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
    };
  };
}
