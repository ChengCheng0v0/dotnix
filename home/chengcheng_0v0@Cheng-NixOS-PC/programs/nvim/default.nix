{ config, vars, ... }:

let
  nvim = vars.home.chengcheng_0v0.nvim;
in {
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvim.configPath;
}
