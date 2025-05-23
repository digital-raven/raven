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
    brave  # Privacy-focused chromium browser.
    easytag  # Easily edit mp3 metadata.
    electrum  # Bitcoin wallet.
    evince  # Reading PDFs.
    gimp  # Comprehensive image editor.
    gparted
    kolourpaint  # Similar to MS-paint.
    libreoffice  # Free office software suite.
    obs-studio  # Record and stream applications and games.
    qbittorrent  # Torrent software
    syncthing  # Sync files between your own computers.
    vlc  # Best video player
    veracrypt  # Manipulate veracrypt volumes.
    vokoscreen  # Basic screen and audio recording.
    wine  # For running windows executables.
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

  # Hardware and Desktop environment.

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  # TODO: Allow customization of xkb.layout.
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [
    pkgs.brlaser
  ];
}
