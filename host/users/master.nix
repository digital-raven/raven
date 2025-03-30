{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  users.users.master = {

    # Change this password (using passwd) after rebooting!
    initialPassword = "masterpass";
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      # Add your SSH public key(s) here, if you plan on using SSH to connect
    ];
    extraGroups = ["master" "docker" "networkmanager" "wheel"];
  };
}
