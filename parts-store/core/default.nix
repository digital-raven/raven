# Core and kit for the pilot.
#
# Always pack snacks, comms, and fire-starters.
{...}: {
  imports = [
    ./core.nix # The core.
    ./kit.nix # Supplemental kit.
  ];
}
