{pkgs, ...}: {
  imports = [
    ./core/default.nix

    # Active system-level attachments.
    ./attachments/system.nix
  ];

  # Packages
  environment.systemPackages = with pkgs; [
    electrum # Bitcoin wallet.
    evince # Reading PDFs.
    kitty # Great desktop-agnostic terminal emulator.
    libreoffice # Free office software suite.
    qbittorrent # Torrent software
    wine # For running windows executables.

    # Allows pass -c to function.
    wl-clipboard # Command-line copy/paste utilities for Wayland. wl-copy
  ];
}
