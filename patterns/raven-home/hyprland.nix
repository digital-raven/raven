# KDE specifc packages and configuration.
{
  pkgs,
  lib,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
  ];

  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  # For waybar.
  services.playerctld.enable = true;

  hardware.graphics.enable = true;

  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };
  # ...

  # simple-hyprland calls out these fonts, but https://wiki.nixos.org/wiki/Fonts
  # says this is how you install all nerd fonts and IDK how to exactly port his list.
  # Here's simple-hyprland's list https://github.com/gaurav23b/simple-hyprland/blob/main/docs/prerequisites.md
  fonts.packages = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  # Hyprland & Critical Softwares
  # https://github.com/gaurav23b/simple-hyprland/blob/main/docs/installation_Hypr.md#hyprland--critical-softwares-%EF%B8%8F
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    configPackages = [pkgs.hyprland];
  };

  security = {
    polkit = {
      enable = true;
      extraConfig = ''
        polkit.addRule(function(action, subject) {
          if ( subject.isInGroup("users") && (
           action.id == "org.freedesktop.login1.reboot" ||
           action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
           action.id == "org.freedesktop.login1.power-off" ||
           action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          ))
          { return polkit.Result.YES; }
        })
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    # Core Hyprland utilities
    hyprland-qt-support
    kdePackages.polkit-kde-agent-1
    kdePackages.dolphin

    # Brightness and Volume Control
    brightnessctl
    pamixer

    # Logout
    hyprlock
    wlogout

    # Useful utilities
    hyprpicker # Color picker
    grimblast # Screenshot

    # mecha waybar
    waybar
    dunst
    fzf
    pulseaudio

    # Plugins
    hyprlandPlugins.hypr-dynamic-cursors
    hyprlandPlugins.hyprspace
  ];

  # also mecha waybar
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = true;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };
}
