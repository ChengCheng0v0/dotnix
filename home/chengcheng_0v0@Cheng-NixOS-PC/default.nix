{ vars, ... }:

{
  home.username = "chengcheng_0v0"; # 用户名
  home.homeDirectory = "/home/chengcheng_0v0"; # 家目录

  imports = let
    share = name: "${vars.nixOsConfigPath}/share/${name}";
    service = name: ./services/${name}.nix;
    desktop = name: ./desktop/${name};
    program = name: ./programs/${name};
  in [
    ./packages.nix            # 用户软件包
    ./programs.nix            # 用户应用程序
    ./defapps.nix             # 默认应用配置

    (share "programs/nvim")   # Neovim (代码编辑器)

    (service "clipse_listener") # Clipse 剪切板监听器
    (service "playerctld")    # playerctl 守护进程
    # (service "spotifyd")      # Spotify 音频播放守护进程

    (desktop "wallpapers")    # 好康的壁纸 (纯图片/视频)
    (desktop "gtk")           # GTK
    (desktop "qt")            # Qt
    (desktop "hypr")          # Hyprland (混成器/窗口管理器)
    (desktop "swww")          # swww (壁纸守护进程)
    (desktop "waybar")        # Waybar (状态栏)
    (desktop "fcitx5")        # Fcitx5 (输入法)
    (desktop "rofi")          # Rofi (程序启动器)

    (program "git")           # Git (版本控制系统)
    (program "kitty")         # Kitty (终端模拟器)
    (program "fish")          # Fish (交互式 Shell)
    (program "yazi")          # Yazi (文件管理器)
    (program "lazygit")       # LazyGit (Git TUI)
    # (program "prettier")      # Prettier (前端格式化工具)
    (program "bat")           # Cat / Less 替代品
    (program "mpv")           # MPV (媒体播放器)
    (program "obs")           # OBS (视频录制/推流/虚拟摄像头)
    (program "spotify-player") # Spotify Player (Spotify TUI 前端)
    (program "clipse")        # Clipse (TUI 剪切板管理器)
    (program "qimgv")         # qimgv (图像查看器)
    (program "gimp")          # GIMP (图像编辑器)
    (program "ssh")           # SSH (SSH 客户端)
    (program "direnv")        # direnv (目录环境变量)
  ];

  # Catppuccin
  catppuccin = {
    flavor = "mocha";
    accent = "pink";
  };

  # 字体
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      /*
        [ Font Name ]    => [ Source ]
        --------------------------------------------
        方正喵呜体       => ./fonts/fzmiaowu.nix
        Maple Mono SC NF => pkgs.maple-mono-SC-NF
        ZCOOL Kuaile     => ./fonts/zcool-kuaile.nix
      */
      sansSerif = [ "ZCOOL Kuaile" ];
      serif = [ "ZCOOL Kuaile" ];
      monospace = [ "Maple Mono SC NF" ];
    };
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
