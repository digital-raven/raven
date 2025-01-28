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
    userName = "REPLACEME_gitUserName";
    userEmail = "REPLACEME_gitUserEmail";
  };
}
