# Stylix for styling applications.
#
{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  stylix.enable = true;

  # Stylix can generate a color scheme from a wallpaper, or load a pre-made scheme.
  #stylix.image = ./swww/Wallpapers/castle.jpg;
  #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";

  # https://github.com/chriskempson/base16/blob/main/styling.md
  # Tokyo Night colors from `kitten theme`
  stylix.base16Scheme = {
    base00 = "0e101a"; # base00 - Default Background
    base01 = "e03600"; # base01 - Lighter Background (Used for status bars, line number and folding marks)
    base02 = "5dcd97"; # base02 - Selection Background
    base03 = "e39500"; # base03 - Comments, Invisibles, Line Highlighting
    base04 = "00a3cb"; # base04 - Dark Foreground (Used for status bars)
    base05 = "795ccc"; # base05 - Default Foreground, Caret, Delimiters, Operators
    base06 = "00a3cb"; # base06 - Light Foreground (Not often used)
    base07 = "ebefc0"; # base07 - Light Background (Not often used)
    base08 = "2b2f46"; # base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = "ff4821"; # base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base0A = "58db9e"; # base0A - Classes, Markup Bold, Search Text Background
    base0B = "f6a100"; # base0B - Strings, Inherited Class, Markup Code, Diff Inserted
    base0C = "00b4e0"; # base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
    base0D = "b3a1e6"; # base0D - Functions, Methods, Attribute IDs, Headings
    base0E = "00b4e0"; # base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
    base0F = "b3b692"; # base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
  };

  #stylix.autoEnable = false;
  stylix.targets.firefox.enable = false; # Todo: firefox doesn't seem to apply
  #stylix.targets.firefox.profileNames = ["default"];
  stylix.targets.hyprland.enable = true;
  stylix.targets.hyprlock.enable = false;
  stylix.targets.kitty.enable = true;
  stylix.targets.rofi.enable = true;
  stylix.targets.waybar.enable = false; # Go read how to update waybar
}
