{ config, pkgs, vars, ... }:

let
  fcitx = vars.home.chengcheng_0v0.fcitx;
in {
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime # Rime 输入法引擎
      fcitx5-lua  # Lua 支持
      fcitx5-gtk  # GTK 支持
      fcitx5-tokyonight # Tokyonight 主题
    ];
  };

  xdg.configFile."fcitx5".source = config.lib.file.mkOutOfStoreSymlink fcitx.configPath;
  xdg.dataFile."fcitx5/rime".source = config.lib.file.mkOutOfStoreSymlink fcitx.rimeSharePath;
}
