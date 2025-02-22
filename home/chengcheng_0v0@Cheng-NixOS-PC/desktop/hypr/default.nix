{ lib, pkgs, vars, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = lib.mkMerge [
      # 配置变量
      (import ./config/vars.nix { inherit pkgs vars; })
      # 环境变量
      (import ./config/env.nix)
      # 自动启动
      (import ./config/autostart.nix)
      # 显示器配置
      (import ./config/monitor.nix)
      # 外观配置
      (import ./config/appearance.nix)
      # 输入配置
      (import ./config/input.nix)
      # 键绑定
      (import ./config/keybinds.nix)
      # 窗口规则
      (import ./config/windowrules.nix)
    ];
  };
}
