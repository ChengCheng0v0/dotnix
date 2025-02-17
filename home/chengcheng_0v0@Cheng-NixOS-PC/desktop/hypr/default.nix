{ lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = lib.mkMerge [
      (import ./config/vars.nix)        # 配置变量
      (import ./config/env.nix)         # 环境变量
      (import ./config/autostart.nix)   # 自动启动
      (import ./config/monitor.nix)     # 显示器配置
      (import ./config/appearance.nix)  # 外观配置
      (import ./config/input.nix)       # 输入配置
      (import ./config/keybinds.nix)    # 键绑定
      (import ./config/windowrules.nix) # 窗口规则
    ];
  };
}
