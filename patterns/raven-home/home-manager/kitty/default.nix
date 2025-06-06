# Good kitty config
{
  ...
}: {

  programs.kitty = {
    enable = true;

    # For more information, see https://sw.kovidgoyal.net/kitty/conf.html
    # For your custom configurations, put it in ./kitty.conf
    extraConfig = ''
      ${builtins.readFile ./kitty.conf}

      # Themes can override any settings in this file
      ${builtins.readFile ./theme.conf}
    '';

    # Use `kitten theme` to see other themes.
    # Run `ls /nix/store/*-kitty-themes-*/share/kitty-themes/themes/` to see their exact names
    #themeFile = "tokyo_night_storm";
  };
}
