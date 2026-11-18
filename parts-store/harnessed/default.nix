# hyprland provided via harnessed.
#
# https://github.com/digital-raven/harnessed.git
#
{
  inputs,
  ...
}: {
  imports = [
    inputs.harnessed.nixosModules.hyprland
  ];
}
