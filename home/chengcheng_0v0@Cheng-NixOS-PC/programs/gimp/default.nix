{ config, pkgs, ... }:

{
  # xdg.configFile."GIMP/3.0/themes".source = pkgs.fetchFromGitHub {
  #   owner = "bunnywaffle";
  #   repo = "GIMP-3-Themes";
  #   rev = "49db35d5ef2ea58006c460d21777554626d67b50";
  #   sha256 = "5UMG5TnQR6hY5PO+b8tbs/RfFZE98OQjjvCdv3/j8VU=";
  # };
  xdg.configFile."GIMP/3.0/themes/Modern-System".source = ./themes/Modern-System;
}
