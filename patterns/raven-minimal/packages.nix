{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
  ];

  # Command-line packages
  environment.systemPackages = with pkgs; [
    bash
    git # World's greatest file versioning.
    pass # Command line password manager. See best practices in the user-guide.
    vim # World's greatest text editor.
  ];
}
