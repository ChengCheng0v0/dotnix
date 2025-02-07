{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-pink-standard+default";
    };
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 20;
    };
    font = {
      name = "ZCOOL Kuaile";
    };
  };
}
