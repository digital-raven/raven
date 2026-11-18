# Full-course terminal.
{...}: {
  imports = [
    ../../parts-store/core
    ../../parts-store/terminal

    # Uncomment for unfree software.
    #
    # parts-store/unfree contains graphical applications, which
    # will not work with this pattern. Double check you've
    # tailored unfree/default.nix accordingly.
    #../../parts-store/unfree
  ];
}
