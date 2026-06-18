# Common desktop utilities.
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
    pavucontrol # Graphical audio configuration.
    wine # For running windows executables.
  ];

  # Enables trash and network options in a file explorer.
  services.gvfs.enable = true;
}
