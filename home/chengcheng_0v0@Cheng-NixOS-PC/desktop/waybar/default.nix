{ config, vars, ... }:

let
  waybar = vars.home.chengcheng_0v0.waybar;
in {
  xdg.configFile."waybar".source = config.lib.file.mkOutOfStoreSymlink waybar.configPath;
}
