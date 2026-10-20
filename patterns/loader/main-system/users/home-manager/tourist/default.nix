# Tourist's home-manager
{...}: {
  imports = [
    # Loader pattern home-manager
    ../../../../home-manager/default.nix

    # Personal
    ./git.nix
    ./gpg.nix
  ];

  home.username = "tourist";
  home.homeDirectory = "/home/tourist";

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://mynixos.com/home-manager/option/home.stateVersion
  home.stateVersion = "25.05";
}
