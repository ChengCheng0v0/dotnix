{ config, vars, ... }:

let
  wp = vars.home.chengcheng_0v0.wallpapers;
in {
  home.file.${wp.linkTarget.picture}.source = config.lib.file.mkOutOfStoreSymlink wp.assetsPath.picture;
  home.file.${wp.linkTarget.video}.source = config.lib.file.mkOutOfStoreSymlink wp.assetsPath.video;
}
