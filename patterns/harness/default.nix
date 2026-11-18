# Harnessed hyprland
#
{pkgs, ...}: {
  imports = [
    ../../parts-store/core
    ../../parts-store/harnessed

    # Agnostic tools.
    ../../parts-store/desktop
    ../../parts-store/terminal
    ../../parts-store/firefox

    # Uncomment to install unfree software.
    #../../parts-store/unfree
  ];
}
