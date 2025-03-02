# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {

  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = ["erasedups" "ignorespace"];
    initExtra = ''
      # Extra settings for non-login shells.
      
      # some more ls aliases
      alias ll='ls -alF'
      alias la='ls -A'
      alias l='ls -CF'
      
      # Alias definitions.
      # You may want to put all your additions into a separate file like
      # ~/.bash_aliases, instead of adding them here directly.
      # See /usr/share/doc/bash-doc/examples in the bash-doc package.
      
      if [ -d $HOME/repos/nix-configs ]; then
          . $HOME/raven/home-manager/resources/alias-alphabet.sh
          . $HOME/raven/nix-configs/home-manager/resources/personal.sh
      fi

      alias mullvad-open='mullvad lockdown-mode set on && mullvad connect'
      alias mullvad-close='mullvad lockdown-mode set off && mullvad disconnect'
      '';
  };
}
