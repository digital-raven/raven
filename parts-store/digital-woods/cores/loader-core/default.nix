# The bare-minimum utilities to install a proper Raven system.
{pkgs, ...}: {
  imports = [
    ./comforts.nix
  ];

  # Loaders are VPN-capable.
  services.mullvad-vpn.enable = true;

  # Command-line packages
  environment.systemPackages = with pkgs; [
    bash
    home-manager
    mullvad

    # Fetch repo
    git

    # Run raven-configure
    gum # For raven-configure
    jq # For raven-configure

    # Touch up edits
    vim # World's greatest text editor.

    # And then install
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
            git clone -o upstream https://codeberg.org/digital-raven/raven.git "$HOME/raven-machines"
        fi

        $HOME/raven-machines/raven-configure
      ''
    )
  ];
}
