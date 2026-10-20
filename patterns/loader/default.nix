# Minimum utilities to install a proper Raven system.
{pkgs, ...}: let
  # ISO pulls exact branch and commit of the repo which built it.
  raven_branch = builtins.getEnv "RAVEN_BRANCH";
  raven_rev = builtins.getEnv "RAVEN_REV";
in {
  imports = [
    # Raven-Core
    ../../parts-store/digital-woods/cores/raven-core/default.nix
  ];

  # install-raven script.
  environment.systemPackages = with pkgs; [
    (
      writeShellScriptBin "install-raven"
      ''
        #!/usr/bin/env bash
        # This script clones the raven-repository and runs raven-configure.
        set -euo pipefail

        if [ "$(id -u)" -eq 0 ]; then
            echo "ERROR! $(basename "$0") should be run as a regular user"
            exit 1
        fi

        if [ ! -d "$HOME/raven-machines" ]; then
            git clone -o upstream --revision ${raven_rev} https://codeberg.org/digital-raven/raven.git "$HOME/raven-machines"
            cd "$HOME/raven-machines"
            git checkout -b ${raven_branch}
            cd -
        fi

        $HOME/raven-machines/raven-configure
      ''
    )
  ];
}
