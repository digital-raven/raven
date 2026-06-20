# Common desktop utilities.
{pkgs, ...}: {
  # Enable all system-level by default.
  imports = [
    ./gaming/default.nix
    ./hyprland/default.nix
    ./media/default.nix
    ./printers/default.nix
    ./web-browsers/default.nix
  ];

  # General Packages
  environment.systemPackages = with pkgs; [
    electrum # Bitcoin wallet.
    evince # Reading PDFs.
    kitty # Great desktop-agnostic terminal emulator.
    libreoffice # Free office software suite.
    pavucontrol # Graphical audio configuration.
    wine # For running windows executables.
  ];

  # Enables trash and network options in a file explorer.
  services.gvfs.enable = true;
}
