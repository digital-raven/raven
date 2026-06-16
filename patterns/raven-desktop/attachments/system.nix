# Attachments with active system-level components.
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
