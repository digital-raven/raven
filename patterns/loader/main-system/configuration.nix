# Loader ISO configuration entrypoint.
{
  pkgs,
  lib,
  ...
}: {
  imports = [
    # Import loader pattern
    ../default.nix

    # Users
    ./users/default.nix
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
    # networkmanager handles wireless communication.
    wireless.enable = false;
    networkmanager.enable = true;

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

  system.stateVersion = lib.mkDefault "25.05";
}
