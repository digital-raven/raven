# Sets GPG agent to a 6 hour timeout.
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
    defaultCacheTtl = 21600;
    maxCacheTtl = 21600;
    pinentry.package = pkgs.pinentry-curses;
  };
}
