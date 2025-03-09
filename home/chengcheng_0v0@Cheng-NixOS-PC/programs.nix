{ pkgs, ... }:

{
  programs = {
    fzf.enable = true;    # 模糊查找器
    htop.enable = true;   # 系统监测器
    poetry.enable = true; # Python 依赖管理器
  };

  catppuccin = {
    fzf.enable = true;
  };
}
