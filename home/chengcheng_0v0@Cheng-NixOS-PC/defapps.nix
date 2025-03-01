{ ... }:

{
  # 环境变量
  home.sessionVariables = {
    PAGER = "bat";
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
  };

  # MIME 类型
  xdg.mimeApps.defaultApplications = {
    # 终端
    "x-scheme-handler/terminal" = [ "kitty.desktop" ];

    # 浏览器
    "text/html" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];

    # 文件管理器
    "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
  };
}
