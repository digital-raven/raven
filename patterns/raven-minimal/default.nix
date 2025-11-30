{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./packages.nix

    # Active system-level attachments.
    ./attachments/system.nix
  ];
}
