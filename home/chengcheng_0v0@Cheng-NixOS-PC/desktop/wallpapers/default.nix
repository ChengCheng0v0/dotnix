{ config, vars, ... }:

let
  wp = vars.home.chengcheng_0v0.wallpapers;
in {
  # home.file.${wp.linkTarget.picture}.source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/wallpapers/picture";
  home.file.${wp.linkTarget.picture}.source = ./picture;
  # home.file.${wp.linkTarget.video}.source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/wallpapers/video";
  home.file.${wp.linkTarget.video}.source = ./video;
}
