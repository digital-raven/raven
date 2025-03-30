# Edit this file to add or remove users.
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
    initialPassword = "master";
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      # Add your SSH public key(s) here, if you plan on using SSH to connect
    ];
    extraGroups = [
      "master"
      "docker"
      "networkmanager"
      "wheel"  # This grants sudo access
    ];
  };

  # Uncomment the following to give the system a "guest" user
  #users.users.guest = {
  #  # Change this password (using passwd) after rebooting!
  #  initialPassword = "guest";
  #  isNormalUser = true;
  #  openssh.authorizedKeys.keys = [
  #    # Add your SSH public key(s) here, if you plan on using SSH to connect
  #  ];
  #  extraGroups = [
  #    "guest" # EDIT_ to the new username.
  #  ];
  #};
}
