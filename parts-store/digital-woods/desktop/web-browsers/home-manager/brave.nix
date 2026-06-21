{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      {id = "khncfooichmfjbepaaaebmommgaepoid";} # unhook
      {id = "gebbhagfogifgggkldgodflihgfeippi";} # return yt dislike
      {id = "fpnmgdkabkmnadcjpehmlllkndpkmiak";} # wayback machine
    ];
  };
  # TODO: Integrate GroupPolicy.json. It's not obvious how to set
  #       initial preferences with Brave in home-manager.
}
