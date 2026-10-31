# Window aesthetics, animations, and tiling behavior.
{...}: {
  # hyprland.conf needs to load the plugins
  wayland.windowManager.hyprland = {
    settings = {
      # https://wiki.hyprland.org/Configuring/Variables/#general
      general = {
        gaps_in = 5;
        gaps_out = 5;

        border_size = 3;

        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        "col.active_border" = "rgb(8aadf4) rgb(24273A) rgb(24273A) rgb(8aadf4) 45deg";
        "col.inactive_border" = "rgb(24273A) rgb(24273A) rgb(24273A) rgb(27273A) 45deg";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false;

        # https://wiki.hyprland.org/Configuring/Tearing/
        allow_tearing = true;

        layout = "dwindle";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration = {
        rounding = 10;
        rounding_power = 2;

        # Change transparency of focused and unfocused windows
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#animations
      animations = {
        enabled = true;

        # See https://wiki.hyprland.org/Configuring/Animations/
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
          "bounceBack, 0.6, 1, 0, 1.14"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "borderangle, 1, 100, linear, loop"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 5, bounceBack, slidefade 80%"
        ];
      };

      # https://wiki.hyprland.org/Configuring/Dwindle-Layout/
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # https://wiki.hyprland.org/Configuring/Master-Layout/
      master = {
        new_status = "master";
      };

      # https://wiki.hyprland.org/Configuring/Window-Rules/
      windowrule = [
        # Ignore maximize requests from apps. You'll probably like this.
        "suppressevent maximize, class:.*"

        # Fix some dragging issues with XWayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

        # Set opacity for core applications
        "opacity 0.90 0.90,class:^(firefox)$"
        "opacity 0.90 0.90,class:^(Brave-browser)$"
        "opacity 0.80 0.80,class:^(kitty)$"
        "opacity 0.80 0.80,class:^(org.gnome.Nautilus)$"
        "opacity 0.80 0.80,class:^(nwg-look)$"
        "opacity 0.80 0.80,class:^(org.pulseaudio.pavucontrol)$"
        "opacity 0.80 0.80,class:^(blueman-manager)$"
        "opacity 0.80 0.80,class:^(nm-applet)$"
        "opacity 0.80 0.80,class:^(nm-connection-editor)$"
        "opacity 0.80 0.80,class:^(polkit-gnome-authentication-agent-1)$"
        "opacity 0.80 0.80,class:^(org.freedesktop.impl.portal.desktop.gtk)$"
        "opacity 0.80 0.80,class:^(org.freedesktop.impl.portal.desktop.hyprland)$"
        "opacity 0.90 0.90,class:^([Ss]team)$"
        "opacity 0.90 0.90,class:^(steamwebhelper)$"
        "opacity 0.90 0.90,class:^(discord)$" # Discord-Electron
        "opacity 0.90 0.90,class:^(WebCord)$" # WebCord-Electron
        "opacity 0.90 0.90,class:^(ArmCord)$" # ArmCord-Electron
      ];

      # You can also configure workspace-specific behaviors.
      # Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
      # "Smart gaps" / "No gaps when only"
      # uncomment all if you wish to use that.
      # workspace = w[tv1], gapsout:0, gapsin:0
      # workspace = f[1], gapsout:0, gapsin:0
      # windowrule = bordersize 0, floating:0, onworkspace:w[tv1]
      # windowrule = rounding 0, floating:0, onworkspace:w[tv1]
      # windowrule = bordersize 0, floating:0, onworkspace:f[1]
      # windowrule = rounding 0, floating:0, onworkspace:f[1]
    };
  };
}
