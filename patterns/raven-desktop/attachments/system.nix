# Enable all system-level by default.
{...}: {
  imports = [
    ./gaming/default.nix
    ./hyprland/default.nix
    ./media/default.nix
    ./printers/default.nix
    ./web-browsers/default.nix

    # Uncomment to install unfree software.
    #./unfree/veracrypt.nix
  ];
}
