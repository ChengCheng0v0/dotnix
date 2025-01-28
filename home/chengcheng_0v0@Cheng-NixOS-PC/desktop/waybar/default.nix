{ config, ... }:

let
  waybarConfigPath = "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/waybar/config";
in {
  xdg.configFile."waybar".source = config.lib.file.mkOutOfStoreSymlink waybarConfigPath;
}
