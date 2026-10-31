# Kitty config. See https://sw.kovidgoyal.net/kitty/conf.html
# and https://mynixos.com/home-manager/options/programs.kitty
#
{...}: {
  programs.kitty = {
    enable = true;

    # Use `kitten theme` to see other themes.
    #themeFile = "tokyo_night_storm";

    # Or bring your own.
    #extraConfig = ''
    #  include Polaris.conf
    #'';

    # Necessary for cursor render as a block.
    shellIntegration.mode = "no-rc no-cursor";

    keybindings = {
      # Open new tabs in same working directory.
      "ctrl+t" = "launch --cwd=current --type=tab";
      "ctrl+shift+t" = "launch --cwd=current --type=tab";
      "ctrl+page_up" = "previous_tab";
      "ctrl+page_down" = "next_tab";
      "ctrl+shift+page_up" = "move_tab_backward";
      "ctrl+shift+page_down" = "move_tab_forward";

      # Detach a tab.
      "ctrl+shift+d" = "detach_tab";
    };

    settings = {
      font_family = "CaskaydiaCove Nerd Font Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      enable_audio_bell = "no";
      font_size = 10.0;
      window_padding_width = 25;

      # Hide top bar, exit button, etc...
      hide_window_decorations = "yes";

      # Squiggle Triggle!!!
      cursor_trail = 1;

      # Don't confirm permission to close.
      confirm_os_window_close = 0;
    };
  };
}
