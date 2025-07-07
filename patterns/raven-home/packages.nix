# Packages useful for a home installation.
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
  ];

  # Packages
  environment.systemPackages = with pkgs; [
    brave # Privacy-focused chromium browser.
    easytag # Easily edit mp3 metadata.
    electrum # Bitcoin wallet.
    evince # Reading PDFs.
    gimp # Comprehensive image editor.
    gparted
    kitty # Great desktop-agnostic terminal emulator.
    libreoffice # Free office software suite.
    obs-studio # Record and stream applications and games.
    qbittorrent # Torrent software
    syncthing # Sync files between your own computers.
    vlc # Best video player
    veracrypt # Manipulate veracrypt volumes.
    vokoscreen # Basic screen and audio recording.
    wine # For running windows executables.
  ];

  # Install firefox.
  programs.firefox.enable = true;

  # Enable smartcards
  services.pcscd.enable = true;

  # Syncthing.
  services.syncthing = {
    enable = false;
    user = "master";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [
    pkgs.brlaser
  ];
}
