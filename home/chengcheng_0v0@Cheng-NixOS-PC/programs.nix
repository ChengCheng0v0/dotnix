{ pkgs, ... }:

{
  programs = {
    fzf.enable = true;    # 模糊查找器
    htop.enable = true;   # 系统监测器
    obs-studio.enable = true; # 视频录制/推流/虚拟摄像头
  };

  catppuccin = {
    fzf.enable = true;
  };
}
