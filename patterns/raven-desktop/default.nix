# Raven-Desktop installs a graphical desktop environment and GUI-based tools.
#
# This environment is Hyprland, with modifications provided via home-manager.
#
{pkgs, ...}: {
  imports = [
    # Raven-Core
    ../../parts-store/digital-woods/cores/raven-core/default.nix

    # All digital-woods terminal software.
    ../../parts-store/digital-woods/terminal/default.nix

    # Desktop environment and associated software.
    ../../parts-store/digital-woods/desktop/default.nix

    # Uncomment to install unfree software.
    #../../parts-store/digital-woods/unfree/discord.nix
    #../../parts-store/digital-woods/unfree/games.nix
    #../../parts-store/digital-woods/unfree/rar.nix
    #../../parts-store/digital-woods/unfree/steam.nix
    #../../parts-store/digital-woods/unfree/veracrypt.nix
  ];
}
