# Active home-manager parts.
{...}: {
  imports = [
    ../obs-studio/home-manager
  ];

  # Disable recent files in a file explorer.
  dconf.settings = {
    "org/gnome/desktop/privacy" = {
      remember-recent-files = false;
    };
  };
}
