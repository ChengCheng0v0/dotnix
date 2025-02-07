{ config, vars, ... }:

let
  fcitx = vars.home.chengcheng_0v0.fcitx;
in {
  xdg.configFile."fcitx5".source = config.lib.file.mkOutOfStoreSymlink fcitx.configPath;
  xdg.dataFile."fcitx5/rime".source = config.lib.file.mkOutOfStoreSymlink fcitx.rimeSharePath;
}
