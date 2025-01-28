{ config, ... }:

let
  hyprConfigPath = "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/hypr/config";
in {
  xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink hyprConfigPath;
}
