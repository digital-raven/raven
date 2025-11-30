# Good kitty config
{...}: {
  programs.kitty = {
    enable = true;

    # Necessary for cursor render as a block.
    shellIntegration.mode = "no-rc no-cursor";

    # For more information, see https://sw.kovidgoyal.net/kitty/conf.html
    # For your custom configurations, put it in ./kitty.conf
    extraConfig = ''
      include kitty-main.conf
    '';

    # Use `kitten theme` to demo other themes.
    # Run `ls /nix/store/*-kitty-themes-*/share/kitty-themes/themes/` to see their exact names
    # for themeFile. These will be different then the names shown by `kitten theme`
    #
    # If you want to switch themes, then you have a few options.
    #
    # 1. Because home-manager will make your ~/.config/kitty/* files read-only, you will not
    #    be able to use home-manager and switch your theme using `kitten theme <theme>`. If you
    #    want to easily make edits during run-time without invoking home-manager, then you need
    #    to remove kitty from your home-manager profile in this repository. From there, copy
    #    your preferred kitty.conf file to ~/.config/kitty/ and run `kitten theme <theme>`
    #    to switch your theme. Don't forget the quotes in the following command.
    #
    #      kitten theme "<theme as seen in kitten>"
    #
    # 2. Change the themeFile below and re-run home-manager.
    #
    # 3. If you wish to manage your kitty.conf in home-manager but be able to switch themes on
    #    the fly, then comment out the line below and see the instructions in ./kitty.conf
    #
    # Some ones I like are...
    #
    #  base2tone-drawbridge-dark
    #  tokyo_night_storm

    #themeFile = "base2tone-drawbridge-dark";
  };


  # Copy over dotfiles
  home.file = {
    ".config/kitty" = {
      source = ./kitty;
      recursive = true;
    };
  };
}
