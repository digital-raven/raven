{...}: {
  imports = [
    ../../raven-terminal/home-manager/default.nix
    ./hyprland/default.nix

    # Active home-manager attachments.
    ../attachments/home-manager.nix
  ];
}
