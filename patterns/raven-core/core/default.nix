# Core and kit for the pilot.
#
# Always bring snacks, binoculars, and a fire-starter.
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./core.nix # The core.
    ./kit.nix # Supplemental kit.
  ];
}
