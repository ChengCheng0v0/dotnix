{ config, ... }:

let
  nvimConfigPath = "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/programs/nvim/config";
in {
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimConfigPath;
}
