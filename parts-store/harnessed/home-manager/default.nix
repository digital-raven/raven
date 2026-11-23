# Edit this file to change the theme.
#
# https://github.com/digital-raven/harnessed.git
#
{inputs, ...}: {
  imports = [
    inputs.harnessed.homeModules.themes
  ];

  # Raven themes. Choose one.
  #harnessed.themes.raven.nightfall.enable = true;
  harnessed.themes.raven.polaris.enable = true;
  #harnessed.themes.raven.stylix.enable = true;
}
