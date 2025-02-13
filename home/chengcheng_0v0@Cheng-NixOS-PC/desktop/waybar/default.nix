{ config, vars, ... }:

let
  waybar = vars.home.chengcheng_0v0.waybar;
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  xdg.configFile."waybar".source = config.lib.file.mkOutOfStoreSymlink waybar.configPath;
}
