{ config, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  # xdg.configFile."waybar".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/waybar/config";
  xdg.configFile."waybar".source = ./config;
}
