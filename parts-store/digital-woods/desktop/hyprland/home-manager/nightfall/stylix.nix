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
  stylix.base16Scheme = {
    base00 = "05010C"; # base00 - Default Background
    base01 = "1E334A"; # base01 - Lighter Background (Used for status bars, line number and folding marks)
    base02 = "DECCFF"; # base02 - Selection Background
    base03 = "C3AAF0"; # base03 - Comments, Invisibles, Line Highlighting
    base04 = "DECCFF"; # base04 - Dark Foreground (Used for status bars)
    base05 = "FFFFFF"; # base05 - Default Foreground, Caret, Delimiters, Operators
    base06 = "DDCCFF"; # base06 - Light Foreground (Not often used)
    base07 = "C2AAF0"; # base07 - Light Background (Not often used)
    base08 = "1E344A"; # base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = "1E344A"; # base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base0A = "B49AE6"; # base0A - Classes, Markup Bold, Search Text Background
    base0B = "B49AE6"; # base0B - Strings, Inherited Class, Markup Code, Diff Inserted
    base0C = "B49AE6"; # base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
    base0D = "B49AE6"; # base0D - Functions, Methods, Attribute IDs, Headings
    base0E = "DECCFF"; # base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
    base0F = "C3AAF0"; # base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
  };

  #stylix.autoEnable = false;
  stylix.targets.firefox.enable = false; # Todo: firefox doesn't seem to apply
  #stylix.targets.firefox.profileNames = ["default"];
  stylix.targets.hyprland.enable = false;
  stylix.targets.hyprlock.enable = false;
  #stylix.targets.kitty.enable = false;
  stylix.targets.rofi.enable = false;
  stylix.targets.waybar.enable = false;
}
