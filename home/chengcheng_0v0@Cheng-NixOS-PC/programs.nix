{ pkgs, ... }:

{
  programs = {
    fzf.enable = true;    # 模糊查找器
    htop.enable = true;   # 系统监测器
  };
}
