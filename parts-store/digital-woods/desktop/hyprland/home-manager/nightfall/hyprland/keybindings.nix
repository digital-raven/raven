# Desktop controls for mouse, keyboard, and touchpad gestures.
{...}: let
  mainMod = "SUPER";
  launchMod = "ALT";
  webBrowser = "firefox";
  terminal = "kitty";
  fileExplorer = "nautilus";
  menu = "rofi";
  menuFlags = "-show drun -theme $HOME/.config/rofi/deathemonic/style.rasi";
  colorPicker = "hyprpicker";
in {
  # hyprland.conf needs to load the plugins
  wayland.windowManager.hyprland = {
    settings = {
      # Keybinds
      # https://wiki.hyprland.org/Configuring/Keywords/
      bindr = [
        # "SUPER" activates the program menu.
        "SUPER, SUPER_L, exec, pkill ${menu} || ${menu} ${menuFlags}"
      ];

      bindel = [
        # Laptop multimedia keys for volume and LCD brightness
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"

        # Requires playerctl
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      # Mouse binds
      bindm = [
        # Move/resize windows with SUPER + LMB/RMB and dragging
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];

      bind = [
        ## Core Applications
        # ALT+[WTF] for web-browser, terminal emulator, and file-explorer.
        "${launchMod}, W, exec, ${webBrowser}"
        "${launchMod}, T, exec, ${terminal}"
        "${launchMod}, F, exec, ${fileExplorer}"

        # CTRL+ALT+[WF] to close all or relaunch web-browser / file-explorer.
        "${launchMod} CTRL, W, exec, pkill ${webBrowser} || ${webBrowser}"
        "${launchMod} CTRL, F, exec, pkill ${fileExplorer} || ${fileExplorer}"

        ## Basic Window Controls
        # Change window focus with mouse, or SUPER+[HJKL←↓↑→]
        "${mainMod}, H, movefocus, l"
        "${mainMod}, J, movefocus, d"
        "${mainMod}, K, movefocus, u"
        "${mainMod}, L, movefocus, r"

        "${mainMod}, left, movefocus, l"
        "${mainMod}, down, movefocus, d"
        "${mainMod}, up, movefocus, u"
        "${mainMod}, right, movefocus, r"

        # Move windows by adding in SHIFT.
        "${mainMod} SHIFT, H, movewindow, l"
        "${mainMod} SHIFT, J, movewindow, d"
        "${mainMod} SHIFT, K, movewindow, u"
        "${mainMod} SHIFT, L, movewindow, r"

        "${mainMod} SHIFT, left, movewindow, l"
        "${mainMod} SHIFT, down, movewindow, d"
        "${mainMod} SHIFT, up, movewindow, u"
        "${mainMod} SHIFT, right, movewindow, r"

        # SUPER+C to close the active window.
        "${mainMod}, C, killactive,"

        # Window float and toggle split.
        "${mainMod}, F, togglefloating,"
        "${mainMod}, V, togglesplit,"

        # Tools! ALT+S for screen shot, ALT+C for color picker. Copied to clipboard.
        "CTRL ALT, S, exec, grimblast copy area"
        "CTRL ALT, C, exec, ${colorPicker} | wl-copy"

        ## System Operations
        # Lock screen and System Exit menu.
        "${mainMod}, BACKSPACE, exec, hyprlock # Backspace"
        "${mainMod}, RETURN, exec, wlogout # Enter"

        # Power-off. Yank it.
        "${mainMod}, ESCAPE, exec, systemctl poweroff -i"

        ## Workspaces
        # Move to workspace right / left.
        # - mainMod + Mouse scroll
        # - or CTRL + HL←→
        "${mainMod}, mouse_down, workspace, +1"
        "${mainMod}, mouse_up, workspace, -1"

        "CTRL,left, workspace, -1"
        "CTRL,H, workspace, -1"
        "CTRL,right, workspace, +1"
        "CTRL,L, workspace, +1"

        # CTRL+SHIFT to move windows between workspaces.
        "${mainMod} SHIFT, mouse_down, movetoworkspace, +1"
        "${mainMod} SHIFT, mouse_up, movetoworkspace, -1"

        "CTRL SHIFT,left, movetoworkspace, -1"
        "CTRL SHIFT,H, movetoworkspace, -1"
        "CTRL SHIFT,right, movetoworkspace, +1"
        "CTRL SHIFT,L, movetoworkspace, +1"

        # Workspace overview via CTRL + JK↓↑
        "CTRL,down, overview:close"
        "CTRL,J, overview:close"
        "CTRL,up, overview:toggle"
        "CTRL,K, overview:toggle"

        ## Additional workspace controls
        # Switch workspaces with mainMod + [0-9]
        "${mainMod}, 1, workspace, 1"
        "${mainMod}, 2, workspace, 2"
        "${mainMod}, 3, workspace, 3"
        "${mainMod}, 4, workspace, 4"
        "${mainMod}, 5, workspace, 5"
        "${mainMod}, 6, workspace, 6"
        "${mainMod}, 7, workspace, 7"
        "${mainMod}, 8, workspace, 8"
        "${mainMod}, 9, workspace, 9"
        "${mainMod}, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "${mainMod} SHIFT, 1, movetoworkspace, 1"
        "${mainMod} SHIFT, 2, movetoworkspace, 2"
        "${mainMod} SHIFT, 3, movetoworkspace, 3"
        "${mainMod} SHIFT, 4, movetoworkspace, 4"
        "${mainMod} SHIFT, 5, movetoworkspace, 5"
        "${mainMod} SHIFT, 6, movetoworkspace, 6"
        "${mainMod} SHIFT, 7, movetoworkspace, 7"
        "${mainMod} SHIFT, 8, movetoworkspace, 8"
        "${mainMod} SHIFT, 9, movetoworkspace, 9"
        "${mainMod} SHIFT, 0, movetoworkspace, 10"
      ];

      # https://wiki.hyprland.org/Configuring/Variables/#input
      input = {
        kb_layout = "us";
        #kb_variant =
        #kb_model =
        #kb_options =
        #kb_rules =

        # Window focus follows mouse.
        follow_mouse = 1;

        # Select a value in the range of [-1.0,1.0]. 0 means no modification.
        sensitivity = 0;

        touchpad = {
          natural_scroll = true;
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };
    };
  };
}
