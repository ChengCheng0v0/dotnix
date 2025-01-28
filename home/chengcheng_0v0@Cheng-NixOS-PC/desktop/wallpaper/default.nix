{ config, ... }:

let
  wpPicturePath = "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/wallpaper/picture";
  wpLinkTarget = "Pictures/wallpaper";
in {
  home.file.${wpLinkTarget}.source = config.lib.file.mkOutOfStoreSymlink wpPicturePath;
}
