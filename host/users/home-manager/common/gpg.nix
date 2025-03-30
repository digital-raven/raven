# Sets GPG agent to a long timeout.
#
# This way you don't have to type your pass password every 10 minutes you need
# a credential.
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 34560000;
    maxCacheTtl = 34560000;
    pinentryPackage = pkgs.pinentry-curses;
  };
}
