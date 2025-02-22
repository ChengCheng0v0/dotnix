/*
  INFO:
  此配置仅适用于 Home Manager，无法在 `configuration.nix` 中使用。
*/

{ config, ... }:

{
  programs.neovim = {
    enable = true;
  };

  # xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/share/programs/nvim/config";
  xdg.configFile."nvim".source = ./config;
}
