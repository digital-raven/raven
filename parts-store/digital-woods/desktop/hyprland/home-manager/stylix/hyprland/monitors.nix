# Monitor settings
# See https://wiki.hyprland.org/Configuring/Monitors/
#
# Example dual-monitor setup with specific refresh rates.
# Run `hyprctl monitors` and map your values to those below if
# you need fine-grained control.
#
# Coordinates are positive to the right and down.
#
#          1920
#           ↓
#       0┌┄┄┌─────┐┄┄┄ x
#   1080→┟──┤     │
#        ┞──┴─────┘
#        ┊
#        y
#
#   # The format is "name, resolution, position (x,y), scale"
#   monitor = [
#     "DP-6, 1920x1080@164.95500, 0x1080, 1"  # Left.
#     "HDMI-A-2, 3840x2160@119.88Hz, 1920x0, 1" # Right.
#   ];
#
{...}: {
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        ",preferred,auto,auto"
      ];
    };
  };
}
