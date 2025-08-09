{inputs, pkgs, ...}: {
  imports = [
    ../kitty/default.nix
  ];

  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      associations.added = {
        "image/*" = [ "org.kde.gwenview.desktop" ];
        "video/*" = [ "vlc.desktop" ];
        "text/*" = [ "vim" ];
      };
      defaultApplications = {
        "image/*" = [ "org.kde.gwenview.desktop" ];
        "video/*" = [ "vlc.desktop" ];
        "text/*" = [ "vim" ];
      };
    };
    portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-hyprland];
      configPackages = [pkgs.hyprland];
    };
  };

  # Hyprland & Critical Softwares
  # https://github.com/gaurav23b/simple-hyprland/blob/main/docs/installation_Hypr.md#hyprland--critical-softwares-%EF%B8%8F
  systemd.user.services.polkit-kde-authentication-agent-1 = {
    Unit = {
      Description = "polkit-kde-authentication-agent-1";
      Wants = ["graphical-session.target"];
      After = ["graphical-session.target"];
    };
    Install = {
      WantedBy = ["graphical-session.target"];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  # Useful utilities
  programs.waybar.enable = true;
  programs.rofi.enable = true;

  services.swww.enable = true;

  # Lock screen and idle
  services.hypridle.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      exec-once = hyprctl plugin load ${pkgs.hyprlandPlugins.hypr-dynamic-cursors.outPath}/lib/libhypr-dynamic-cursors.so
      exec-once = hyprctl plugin load ${pkgs.hyprlandPlugins.hyprspace.outPath}/lib/libhyprspace.so
      source = hyprland-main.conf
    '';
  };

  # Other files
  home.file = {
    ".config/assets" = { source = ./dotfiles/assets; recursive = true; };
    ".config/dunst" = { source = ./dotfiles/dunst; recursive = true; };
    ".config/hypr" = { source = ./dotfiles/hypr; recursive = true; };
    ".config/menus/applications.menu" = {source = ./dotfiles/menus/applications.menu;};
    ".config/rofi" = { source = ./dotfiles/rofi; recursive = true; };
    ".config/waybar" = { source = ./dotfiles/waybar; recursive = true; };
    ".config/wlogout" = { source = ./dotfiles/wlogout; recursive = true; };
  };
}
