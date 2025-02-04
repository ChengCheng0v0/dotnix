{ pkgs, ... }:

{
  # 主机名
  networking.hostName = "Cheng-NixOS-PC";

  imports = [
    ./hardware-configuration.nix  # 硬件配置

    ./users.nix                   # 用户配置
    ./packages.nix                # 系统软件包

    ./fhs-environment.nix         # FHS 环境

    ../../share/programs/dae      # dae 代理配置
  ];

  # Nix 配置
  nix.settings = {
    # 启用实验性功能
    experimental-features = [ "nix-command" "flakes" ];

    # https://github.com/shlevy/nix-plugins
    plugin-files = "${pkgs.nix-plugins}/lib/nix/plugins";
    extra-builtins-file = [ "/etc/nixos/libs/extra-builtins.nix" ];
  };

  # 机密配置
  sops = {
    defaultSopsFile = ../../secrets/default.json;
    age = {
      keyFile = "/var/lib/sops/age-key.txt";
      # sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    };

    secrets = {
      "proxySubscriptions/catnet/website" = {};
      "proxySubscriptions/catnet/link" = {};

      "gitCredentials/chengcheng_0v0/host" = {};
      "gitCredentials/chengcheng_0v0/username" = {};
      "gitCredentials/chengcheng_0v0/password" = {};
    };
  };

  # 启用 nix-ld
  programs.nix-ld.enable = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # 启用 NetworkManager
  networking.networkmanager.enable = true;

  # 网络代理
  # networking.proxy.default = "http://192.168.2.10:7890";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # OpenSSH
  services.openssh = {
    enable = true;
  };

  # 本地化
  time.timeZone = "Asia/Shanghai";
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "zh_CN.UTF-8";
      LC_IDENTIFICATION = "zh_CN.UTF-8";
      LC_MEASUREMENT = "zh_CN.UTF-8";
      LC_MONETARY = "zh_CN.UTF-8";
      LC_NAME = "zh_CN.UTF-8";
      LC_NUMERIC = "zh_CN.UTF-8";
      LC_PAPER = "zh_CN.UTF-8";
      LC_TELEPHONE = "zh_CN.UTF-8";
      LC_TIME = "zh_CN.UTF-8";
    };
  };

  # X Server
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  # GNOME
  services.xserver.desktopManager.gnome.enable = true;

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # 键盘布局
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # 音频服务
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # 字体
  fonts.fontconfig.enable = true;
  fonts.enableDefaultPackages = true;

  # 启用 Firefox
  programs.firefox.enable = true;
  # 启用 Fish Shell
  programs.fish.enable = true;
  # 启用 GnuPG
  programs.gnupg.agent.enable = true;

  # 允许非自由软件
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "unstable";
}
