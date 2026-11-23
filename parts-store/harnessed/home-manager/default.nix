# Edit this file to change the theme.
#
# https://github.com/digital-raven/harnessed.git
#
{inputs, ...}: {
  imports = [
    inputs.harnessed.homeModules.themes
  ];

  # Raven themes. Choose one.
  #themes.raven.nightfall.enable = true;
  themes.raven.polaris.enable = true;
  #themes.raven.stylix.enable = true;
}
