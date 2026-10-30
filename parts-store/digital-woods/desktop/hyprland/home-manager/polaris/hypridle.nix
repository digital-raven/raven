# Hypridle causes your computer to idle and lock after a time.
#
# Raven doesn't idle unless you tell it to, but idling behavior
# can be configured by uncommenting the settings.
{...}: {
  services.hypridle = {
    enable = true;

    settings = {
      #general = {
      #  lock_cmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
      #  before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
      #  after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display.
      #};

      #listener = [
      #  {
      #    timeout = 3600; # hour.
      #    on-timeout = "brightnessctl -s set 5"; # set monitor backlight to minimum, avoid 0 on OLED monitor.
      #    on-resume = "brightnessctl -r"; # monitor backlight restore.
      #  }

      #  {
      #    timeout = 3600; # 1 hour
      #    on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
      #  }

      #  {
      #    timeout = 7200; # 2 hours
      #    on-timeout = "hyprctl dispatch dpms off"; # screen off when timeout has passed
      #    on-resume = "hyprctl dispatch dpms on"; # screen on when activity is detected after timeout has fired.
      #  }

      #  {
      #    timeout = "900"; # 30min
      #    on-timeout = "systemctl suspend"; # suspend pc
      #  }
      #];
    };
  };
}
