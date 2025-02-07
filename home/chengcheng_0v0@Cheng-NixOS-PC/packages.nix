{ pkgs, ... }:

{
  home.packages = with pkgs;[
    # 终端工具
    neofetch    # 经典身份证
    fastfetch   # 时尚身份证
    eza         # ls 替代品
    nmap        # 网络安全工具
    zoxide      # 更智能的 cd

    # 桌面环境
    swww        # 壁纸守护进程

    # 开发工具
    commitizen  # Git 提交格式化工具
    just        # 命令执行器

    # 媒体播放
    pavucontrol # 音频控制
    spotify     # 流媒体音乐
    vlc         # 视频播放器

    # 字体
    (import ./fonts/zcool-kuaile.nix { inherit stdenv lib; })

    # 光标主题
    bibata-cursors
  ];
}
