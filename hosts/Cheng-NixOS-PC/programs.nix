{
  programs = {
    nix-ld.enable = true; # NixOS 上的动态链接库
    firefox.enable = true; # 网页浏览器
    fish.enable = true;   # 交互式 Shell
    gnupg.agent.enable = true; # GnuPG Agent
  };
}
