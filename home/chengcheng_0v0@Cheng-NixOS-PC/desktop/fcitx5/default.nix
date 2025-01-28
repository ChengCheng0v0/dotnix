{ config, ... }:

let
  fcitxConfigPath = "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/fcitx5/config";
  rimeSharePath = "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/fcitx5/share/rime";
in {
  xdg.configFile."fcitx5".source = config.lib.file.mkOutOfStoreSymlink fcitxConfigPath;
  xdg.dataFile."fcitx5/rime".source = config.lib.file.mkOutOfStoreSymlink rimeSharePath;
}
