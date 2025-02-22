{ config, ... }:

{
  programs.neovim = {
    enable = true;
  };

  # xdg.configFile."qimgv".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/programs/qimgv/config";
  xdg.configFile."qimgv".source = ./config;
}
