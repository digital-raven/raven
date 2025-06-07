# Good kitty config
{
  ...
}: {

  programs.kitty = {
    enable = true;

    # Necessary for cursor render as a block.
    shellIntegration.mode = "no-rc no-cursor";

    # For more information, see https://sw.kovidgoyal.net/kitty/conf.html
    # For your custom configurations, put it in ./kitty.conf
    extraConfig = ''
      ${builtins.readFile ./kitty.conf}
    '';

    # Use `kitten theme` to demo other themes.
    # Run `ls /nix/store/*-kitty-themes-*/share/kitty-themes/themes/` to see their exact names
    themeFile = "tokyo_night_storm";
  };
}
