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

  # Colors
  #
  # https://commons.wikimedia.org/wiki/File:Minnesota_flag_submission_F1953.svg
  # - polaris-night = 1e344a
  # - polaris-river = 58cfe9
  # - polaris-woods = 027e50
  # - polaris-star = ffffff
  #
  # https://www.sos.mn.gov/about-minnesota/state-symbols
  # - lady-slipper_pink = ad499c
  # - seal-gold = e7cb05
  # - charlie-orange = b7410e
  # - blueberry = 4f86f7
  #
  # From Obsidian Purple
  # - obsidian-dark = 05010C

  # https://github.com/chriskempson/base16/blob/main/styling.md
  stylix.base16Scheme = {
    base00 = "05010c"; # base00 - Default Background
    base01 = "1e344a"; # base01 - Lighter Background (Used for status bars, line number and folding marks)
    base02 = "4f86f7"; # base02 - Selection Background
    base03 = "58cfe9"; # base03 - Comments, Invisibles, Line Highlighting
    base04 = "05010c"; # base04 - Dark Foreground (Used for status bars)
    base05 = "ffffff"; # base05 - Default Foreground, Caret, Delimiters, Operators
    base06 = "ffffff"; # base06 - Light Foreground (Not often used)
    base07 = "1e344a"; # base07 - Light Background (Not often used)
    base08 = "ad499c"; # base08 - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    base09 = "027e50"; # base09 - Integers, Boolean, Constants, XML Attributes, Markup Link Url
    base0A = "58cfe9"; # base0A - Classes, Markup Bold, Search Text Background
    base0B = "027e50"; # base0B - Strings, Inherited Class, Markup Code, Diff Inserted
    base0C = "ad499c"; # base0C - Support, Regular Expressions, Escape Characters, Markup Quotes
    base0D = "58cfe9"; # base0D - Functions, Methods, Attribute IDs, Headings
    base0E = "58cfe9"; # base0E - Keywords, Storage, Selector, Markup Italic, Diff Changed
    base0F = "58cfe9"; # base0F - Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
  };

  #stylix.autoEnable = false;
  stylix.targets.firefox.enable = false; # Todo: firefox doesn't seem to apply
  #stylix.targets.firefox.profileNames = ["default"];
  stylix.targets.hyprland.enable = false;
  stylix.targets.hyprlock.enable = false;
  stylix.targets.kitty.enable = false;
  stylix.targets.rofi.enable = false;
  stylix.targets.waybar.enable = false;
}
