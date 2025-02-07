{ config, ... }:

let
  wpAssetsPath.picture = "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/wallpapers/picture";
  wpLinkTarget.picture = "Pictures/wallpaper";
  wpAssetsPath.video = "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/wallpapers/video";
  wpLinkTarget.video = "Videos/wallpaper";
in {
  home.file.${wpLinkTarget.picture}.source = config.lib.file.mkOutOfStoreSymlink wpAssetsPath.picture;
  home.file.${wpLinkTarget.video}.source = config.lib.file.mkOutOfStoreSymlink wpAssetsPath.video;
}
