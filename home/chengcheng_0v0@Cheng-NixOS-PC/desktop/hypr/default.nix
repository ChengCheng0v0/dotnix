{ config, vars, ... }:

let
  hypr = vars.home.chengcheng_0v0.hypr;
in {
  xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink hypr.configPath;
}
