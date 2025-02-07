{ lib, pkgs, ... }:

{
  home.username = "chengcheng_0v0"; # 用户名
  home.homeDirectory = "/home/chengcheng_0v0"; # 家目录

  imports = let
    desktop = name: ./desktop/${name};
    program = name: ./programs/${name};
  in [
    ./packages.nix            # 用户软件包
    ./defapps.nix             # 默认应用配置

    (desktop "desktop-files")  # 自定义的 .desktop 文件
    (desktop "wallpapers")     # 好康的壁纸 (纯图片/视频)
    (desktop "hypr")          # Hyprland (混成器/窗口管理器)
    (desktop "swww")          # swww (壁纸守护进程)
    (desktop "waybar")        # Waybar (状态栏)
    (desktop "fcitx5")        # Fcitx5 (输入法)
    (desktop "rofi")          # Rofi (程序启动器)

    (program "kitty")         # Kitty (终端模拟器)
    (program "fish")          # Fish (交互式 Shell)
    (program "nvim")          # Neovim (代码编辑器)
    (program "yazi")          # Yazi (文件管理器)
    (program "lazygit")       # LazyGit (Git TUI)
    (program "prettier")      # Prettier (前端格式化工具)
    (program "bat")           # Cat / Less 替代品
  ];

  # Git
  programs.git = {
    enable = true;
    userEmail = "chengcheng@miao.ms";
    userName = "成成0v0";

    /* ----------------------------------------------------- *
      sec   rsa2048 2024-10-25 [SCEAR]
            58E6F884D0EA5D3039EB3D68EB30D47C23175F56
      uid             [ 绝对 ] 成成0v0 <chengcheng@miao.ms>
      ssb   rsa2048 2024-10-25 [SEA]                         */
    signing.key = "58E6F884D0EA5D3039EB3D68EB30D47C23175F56";
    /* -----------^----------------------------------------^ */

    extraConfig = {
      credential.helper = "store"; # 使用 .git-credentials 中的身份验证信息
      commit = {
        gpgSign = true;
        verbose = true;
      };
      pull.rebase = false;
    };
  };
  # 从机密中获取信息并写入 .git-credentials
  home.activation.writeGitCredentials = let
    getSecret = builtins.extraBuiltins.getSecret;
  in lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    echo "https://${getSecret "gitCredentials/chengcheng_0v0/username"}:${getSecret "gitCredentials/chengcheng_0v0/password"}@${getSecret "gitCredentials/chengcheng_0v0/host"}" > ~/.git-credentials
    chmod 600 ~/.git-credentials
  '';

  # 输入法
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime # Rime 输入法引擎
      fcitx5-lua  # Lua 支持
      fcitx5-gtk  # GTK 支持
      fcitx5-tokyonight # Tokyonight 主题
    ];
  };

  # 字体
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      /*
        [ Font Name ]    => [ Source ]
        --------------------------------------------
        ZCOOL Kuaile     => ./fonts/zcool-kuaile.nix
        Maple Mono SC NF => pkgs.maple-mono-SC-NF
      */
      sansSerif = ["ZCOOL Kuaile"];
      serif = ["ZCOOL Kuaile"];
      monospace = ["Maple Mono SC NF"];
    };
  };

  # Electron 与 Wayland 的兼容性配置
  home.sessionVariables.NIXOS_OZONE_WL = "1";
  xdg.configFile."electron-flags.conf".text = ''
    --enable-features=UseOzonePlatform
    --ozone-platform=wayland
    --enable-wayland-ime
  '';

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
