{
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];

  nixpkgs = {
    hostPlatform = lib.mkDefault "x86_64-linux";
    config.allowUnfree = true;
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
    hostName = "raven-iso";
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

  environment.systemPackages = with pkgs; [
    bash
    git
    gum
    jq
    vim
    (
      writeShellScriptBin "install-raven"
      ''
        #!/usr/bin/env bash
        # This script clones the raven-repository and runs raven-configure
        # Before installation
        set -euo pipefail

        if [ "$(id -u)" -eq 0 ]; then
            echo "ERROR! $(basename "$0") should be run as a regular user"
            exit 1
        fi

        if [ ! -d "$HOME/raven-machines" ]; then
            git clone https://github.com/digital-raven/raven.git "$HOME/raven-machines"
        fi

        $HOME/raven-machines/raven-configure
      ''
    )
  ];
}
