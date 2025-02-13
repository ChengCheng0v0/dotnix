{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      osd-bar = false;
      border = false;
    };

    scripts = with pkgs.mpvScripts; [
      (uosc.overrideAttrs { # 交互式 UI
        version = "5.8.0";
      })
      thumbfast # 缩略图生成器
    ];
  };

  catppuccin.mpv.enable = true;
}
