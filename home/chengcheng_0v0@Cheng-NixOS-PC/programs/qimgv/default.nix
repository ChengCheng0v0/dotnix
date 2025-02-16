{ config, vars, ... }:

let
  qimgv = vars.home.chengcheng_0v0.qimgv;
in {
  programs.neovim = {
    enable = true;
  };

  xdg.configFile."qimgv".source = config.lib.file.mkOutOfStoreSymlink qimgv.configPath;
}
