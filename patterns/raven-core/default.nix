# Raven-Core provides a full terminal experience.
#
# A machine with this pattern can log in via TTY and access
# the software provided by digital-woods/raven-core
# and digital-woods/terminal.
{...}: {
  imports = [
    # Raven-Core
    ../../parts-store/digital-woods/cores/raven-core/default.nix

    # Full-course. All digital-woods terminal utilities.
    ../../parts-store/digital-woods/terminal/default.nix

    # Uncomment for unfree software.
    #../../parts-store/digital-woods/unfree/rar.nix
  ];
}
