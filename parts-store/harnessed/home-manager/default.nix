# Edit this file to change the theme.
#
# https://github.com/digital-raven/harnessed.git
#
{inputs, ...}: {
  imports = [
    # Raven themes: Enable one at a time
    #inputs.harnessed.themes.raven.nightfall
    inputs.harnessed.themes.raven.polaris
    #inputs.harnessed.themes.raven.stylix
  ];
}
