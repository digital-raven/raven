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

  users.extraUsers.root.password = "root";

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
        set -euo pipefail

        if [ "$(id -u)" -eq 0 ]; then
            echo "ERROR! $(basename "$0") should be run as a regular user"
            exit 1
        fi

        if [ ! -d "$HOME/raven-machines" ]; then
            git clone https://github.com/digital-raven/raven.git "$HOME/raven-machines"
        fi

        cd $HOME/raven-machines

        # Select hostname
        HOSTNAME=$(gum input --prompt "What will you name your AC? " --placeholder "nightfall")

        # Git username and email
        if gum confirm --default=false "(Optional) Enter name and email you use for git commits?; then
          GIT_USERNAME=$(gum input --prompt "Enter your name for git commits: ") --placeholder "Raven"
          GIT_EMAIL=$(gum input --prompt "Enter your email for git commits: ") --placeholder "raven@rubicon.aleeas.com"
        fi

        # Select timezone
        TIMEZONE=timedatectl list-timezones | gum choose --height=30

        # Select locale
        LOCALE="en_US.UTF-8"
        if gum confirm --default=false "Select a locale other than $LOCALE? "; then
          LOCALE=$(wget -qO - 'https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=localedata/SUPPORTED' | sed -s 's/\\//' | tail -n +4 | gum choose --height=40 --header="Supported Locales")
        fi

        # Disk selection
        sda_devices="$(lsblk -JpS -o NAME,VENDOR,MODEL,REV,SERIAL,SIZE)"
        nvme_devices="$(lsblk -JpN -o NAME,VENDOR,MODEL,REV,SERIAL,SIZE)"

        TARGET_DISK=$(echo "$sda_devices" \
          "$nvme_devices" | jq -s '[.[].blockdevices[]] | map({name, vendor, model, rev, serial, size})' | jq -r '(.[0] | keys_unsorted) as $keys | $keys, map([.[ $keys[] ]])[] | @csv' | gum table) | awk -F, '{print $1}'

        gum confirm  --default=false \
          "This will erase $TARGET_DISK and format it for Raven. Is this correct?"

        echo "Partitioning Disks"
        sudo nix run github:nix-community/disko \
        --extra-experimental-features "nix-command flakes" \
        --no-write-lock-file \
        -- \
        --mode zap_create_mount \
        "$HOME/dotfiles/hosts/$TARGET_HOST/disks.nix"

        gum confirm --default=false "Install now?"

        sudo nixos-install --flake "$HOME/#$TARGET_HOST"
      ''
    )
  ];
}
