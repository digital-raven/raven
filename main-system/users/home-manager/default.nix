# Add or remove users from home-manager.
#
# Adding New Users
# - Add them to this file.
# - Copy an existing directory.
#   - Change its name and modify its contents.
#
# Removing a User
# - Undo that stuff I just said.
#
{...}: {
  home-manager.users.master = import ./master;

  #home-manager.users.guest = import ./guest;
}
