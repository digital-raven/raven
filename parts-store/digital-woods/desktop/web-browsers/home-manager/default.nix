# Firefox is the only browser by default.
#
# Brave and librewolf can be inserted here manually if you wish to install them.
{...}: {
  imports = [
    ./firefox.nix
  ];
}
