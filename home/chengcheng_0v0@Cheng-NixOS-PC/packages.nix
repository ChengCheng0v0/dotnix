{ pkgs, ... }:

{
  home.packages = with pkgs;[
    # 终端工具
    kitty       # 终端模拟器
    neofetch    # 经典身份证
    fastfetch   # 时尚身份证
    yazi        # 文件管理器
    eza         # ls 替代品
    fzf         # 模糊查找器
    nmap        # 网络安全工具
    htop        # 系统监测器
    lazygit     # Git TUI

    # 桌面环境
    waybar      # 状态栏
    swww        # 壁纸守护进程

    # 开发工具
    commitizen  # Git 提交格式化工具

    # 媒体播放
    pavucontrol # 音频控制
    spotify     # 流媒体音乐
    vlc         # 视频播放器

    # 字体
    (import ./fonts/zcool-kuaile.nix { inherit stdenv lib; })
  ];
}
