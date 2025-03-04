{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # dotnix
    dotnix.wallpaper_picker # 壁纸选择器

    # 语言支持
    rust-analyzer # Rust 分析器
    rustfmt     # Rust 代码格式化工具

    # 开发工具
    commitizen  # Git 提交格式化工具
    just        # 命令执行器
    beekeeper-studio # SQL 管理器
    usql        # 通用的 SQL 命令行接口

    # 终端工具
    neofetch    # 经典身份证
    fastfetch   # 时尚身份证
    eza         # ls 替代品
    nmap        # 网络安全工具
    dig         # DNS 查询工具
    zoxide      # 更智能的 cd
    thefuck     # 爆炒命令行
    lnav        # 日志文件导航器
    sysz        # systemctl 的 Fzf TUI
    gpg-tui     # GnuPG 的 TUI 管理器
    termscp     # TUI 文件传输工具

    # 桌面环境
    swww        # 壁纸守护进程
    grim        # Wayland 截图工具
    slurp       # Wayland 屏幕选择器
    clipse      # TUI 剪切板管理器

    # 桌面工具
    pot         # 派了个萌的翻译器
    qimgv       # 图像查看器

    # 媒体播放
    pavucontrol # 音频控制
    spotify     # 流媒体音乐
    feishin     # 自托管音乐播放器
    vlc         # 视频播放器

    # 社交通讯
    ayugram-desktop # 第三方 Telegram 客户端

    # 其它
    rustlings   # Rust 小练习
    tesseract   # OCR 引擎
    playerctl   # 播放控制器
    (import (fetchTarball {
      url = "https://github.com/jtojnar/nixpkgs/archive/gimp-meson.tar.gz";
      sha256 = "100j46iv0cqlgbzv99kngf3254269m0dcbwnqfxdil8j5n2a83sl";
    }) {}).gimp # 图像编辑器
    sshfs       # SSH 文件系统
    postgresql  # 数据库

    # 字体
    (import ./fonts/zcool-kuaile.nix { inherit stdenv lib; })

    # 光标主题
    bibata-cursors
  ];
}
