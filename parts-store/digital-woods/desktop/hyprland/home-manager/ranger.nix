# Find settings here.
# https://github.com/ranger/ranger/blob/master/ranger/config/rc.conf
{...}: {
  programs.ranger = {
    enable = true;
    settings = {
      open_all_images = true;
      preview_images = true;
      preview_images_method = "kitty";
    };
  };
}
