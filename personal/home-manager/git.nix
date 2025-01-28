{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {

  programs.git = {
    enable = true;
    userName = "REPLACEME_userName";
    userEmail = "REPLACEME_userEmail";
  };
}
