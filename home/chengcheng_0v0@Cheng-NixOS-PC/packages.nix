{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # 终端工具
    neofetch    # 经典身份证
    fastfetch   # 时尚身份证
    eza         # ls 替代品
    nmap        # 网络安全工具
    zoxide      # 更智能的 cd

    # 桌面环境
    swww        # 壁纸守护进程
    grim        # Wayland 截图工具
    slurp       # Wayland 屏幕选择器

    # 语言支持
    rust-analyzer # Rust 分析器
    rustfmt     # Rust 代码格式化工具

    # 开发工具
    commitizen  # Git 提交格式化工具
    just        # 命令执行器

    # 实用工具
    nemo        # 文件管理器
    pot         # 派了个萌的翻译器
    qimgv       # 图像查看器

    # 媒体播放
    pavucontrol # 音频控制
    spotify     # 流媒体音乐
    vlc         # 视频播放器

    # 社交通讯
    ayugram-desktop # 第三方 Telegram 客户端

    # 其它
    rustlings   # Rust 小练习
    tesseract   # OCR 引擎
    playerctl   # 播放控制器

    # 字体
    (import ./fonts/zcool-kuaile.nix { inherit stdenv lib; })

    # 光标主题
    bibata-cursors
  ];
}
