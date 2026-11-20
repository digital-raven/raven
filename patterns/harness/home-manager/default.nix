# Imports harnessed
{...}: {
  imports = [
    # Harnessed Hyprland
    ../../../parts-store/core/home-manager
    ../../../parts-store/harnessed/home-manager

    # Agnostic application preferences.
    ../../../parts-store/terminal/home-manager
    ../../../parts-store/desktop/home-manager

    # Firefox
    ../../../parts-store/firefox/home-manager
  ];
}
