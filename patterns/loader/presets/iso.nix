# Installation ISO.
{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../default.nix
  ];

  nixpkgs = {
    hostPlatform = lib.mkDefault "x86_64-linux";
    config.allowUnfree = false;
  };

  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    extraOptions = "experimental-features = nix-command flakes";
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = lib.mkForce ["ext4" "ntfs"];
  };

  networking = {
    hostName = "loader";
  };

  # gnome power settings do not turn off screen
  systemd = {
    targets = {
      sleep.enable = false;
      suspend.enable = false;
      hibernate.enable = false;
      hybrid-sleep.enable = false;
    };
  };

  # Docker
  virtualisation.docker.enable = true;

  users.mutableUsers = false;
  users.users.nixos = {
    enable = false;
  };
  services.getty.autologinUser = lib.mkForce "tourist";

  users.users.tourist = {
    isNormalUser = true;
    home = "/home/tourist";
    description = "Looks like you're having fun, tourist.";
    extraGroups = [
      "tourist"
      "master"
      "networkmanager"
      "docker"
      "wheel"
    ];
  };

  system.stateVersion = lib.mkDefault "25.05";
}
