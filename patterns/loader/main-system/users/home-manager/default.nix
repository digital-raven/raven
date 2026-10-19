# Configure tourist's home-manager.
{...}: {
  home-manager.users.tourist = import ./tourist;
}
