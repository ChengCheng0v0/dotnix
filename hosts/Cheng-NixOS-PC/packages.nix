{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # 语言支持
    pkg-config  # pkg-config 工具
    gcc         # GNU 编译器集合
    clang       # C 语言编译器
    rustc       # Rust 语言编译器
    cargo       # Rust 的包管理器
    python314   # Python 3.14
    nodejs_23   # Node.js 23

    # 系统工具
    wget        # 从互联网获取文件
    aria2       # 多线程下载器
    unzip       # Zip 解压工具
    age         # 加密工具
    sops        # 机密管理器
    ntfs3g      # NTFS 工具

    # 终端工具
    jq          # JSON 处理器
    choose      # 快速的 cut / awk 替代方案

    # 桌面环境
    hyprland    # 混成器/窗口管理器
    hyprpaper   # Hyprland 壁纸守护进程
    xdg-desktop-portal-hyprland # Hyprland 的 XDG 支持
    wl-clipboard # Wayland 剪切板
    rofi        # 程序启动器
    gtk3        # GTK 3
    gtk4        # GTK 4

    # 开发工具
    neovim      # 代码编辑器
    git         # 版本控制系统

    # 其它
    caddy       # HTTP 服务器
    gum         # 华丽的 Shell 脚本工具
  ];

  fonts.packages = with pkgs; [
    maple-mono
    maple-mono-NF
    maple-mono-SC-NF
    fira-sans
    fira-mono
    fira-code
    nerd-fonts.fira-code
    font-awesome
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];
}
