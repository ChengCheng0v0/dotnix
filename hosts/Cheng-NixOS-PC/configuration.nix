{ pkgs, ... }:

{
  # 主机名
  networking.hostName = "Cheng-NixOS-PC";

  # 允许非自由软件
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./hardware_configuration.nix  # 硬件配置

    ./users.nix                   # 用户配置
    ./packages.nix                # 系统软件包
    ./programs.nix                # 系统应用程序

    ./modules/fhs_environment.nix # FHS 环境

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

  # Bootloader
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_zen; # 使用 Zen 内核
  };

  # 系统环境变量
  environment.variables = {
    __NIX_LD_PATH = builtins.replaceStrings ["\n"] [""] (builtins.readFile "${pkgs.stdenv.cc}/nix-support/dynamic-linker");
  };

  # 网络连接
  networking = {
    networkmanager.enable = true;

    defaultGateway = "192.168.2.1";
    nameservers = [ "223.5.5.5" "1.1.1.1" "8.8.8.8" ];
    interfaces.enp4s0 = {
      ipv4.addresses = [
        {
          address = "192.168.2.2";
          prefixLength = 24;
        }
      ];
    };
  };

  # OpenSSH
  services.openssh = {
    enable = true;
    settings = {
      Macs = [
        "hmac-sha2-512"
        "hmac-sha2-256"
        "hmac-sha1"
        "hmac-sha2-512-etm@openssh.com"
        "hmac-sha2-256-etm@openssh.com"
        "umac-128-etm@openssh.com"
      ];
    };
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

  # 启用 OpenTabletDriver
  hardware.opentabletdriver.enable = true;

  # 音频服务
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    extraConfig.pipewire."99-rates" = {
      "context.properties" = {
        "default.clock.rate" = 192000;
        "defautlt.allowed-rates" = [ 192000 48000 44100 ];
        # "defautlt.allowed-rates" = [ 192000 ];
      };
    };
  };

  # 字体
  fonts.fontconfig.enable = true;
  fonts.enableDefaultPackages = true;

  system.stateVersion = "25.05";
}
