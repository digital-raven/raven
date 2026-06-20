{...}: {
  imports = [
    # Raven-Core.
    ../../parts-store/digital-woods/cores/raven-core/home-manager/default.nix

    # Terminal utilities.
    ../../parts-store/digital-woods/terminal/home-manager.nix

    # Hyprland and associated software.
    ../../parts-store/digital-woods/desktop/home-manager.nix
  ];
}
