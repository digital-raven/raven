# Loader's only user is tourist.
{lib, ...}: {
  # Disable root user. Nothing hashes to just "!", so this effectively disables
  # password authentication for root.
  # A user with sudo access can still use `sudo su` to get into root.
  users.users.root.hashedPassword = "!";

  users.mutableUsers = false;
  users.users.nixos = {
    enable = false;
  };
  services.getty.autologinUser = lib.mkForce "tourist";

  users.users.tourist = {
    isNormalUser = true;
    home = "/home/tourist";
    description = "Looks like you're having fun, tourist.";
    extraGroups = [
      "tourist"
      "master"
      "networkmanager"
      "docker"
      "wheel"
    ];
  };
}
