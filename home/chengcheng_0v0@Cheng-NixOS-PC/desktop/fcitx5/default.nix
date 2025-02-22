{ config, pkgs, ... }:

let
  rime-frost = with pkgs; (import ./packages/rime-frost.nix { inherit stdenv lib fetchFromGitHub librime; });
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

  home.packages = [ rime-frost ];

  catppuccin.fcitx5 = {
    enable = true;
    apply = false;
    flavor = "macchiato";
  };

  # xdg.configFile."fcitx5".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/fcitx5/config";
  xdg.configFile."fcitx5".source = ./config;
  # xdg.dataFile."fcitx5/rime".source = config.lib.file.mkOutOfStoreSymlink fcitx.rimeSharePath;
  xdg.dataFile."fcitx5/rime".source = "${rime-frost}/share/fcitx5/rime";
}
