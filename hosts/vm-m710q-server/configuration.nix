{ modulesPath, pkgs, vars, ... }:

{
  # 主机名
  networking.hostName = "vm-m710q-server";

  # 允许非自由软件
  nixpkgs.config.allowUnfree = true;

  imports = let
    share = name: ../../share/${name};
    security = name: ./modules/security/${name}.nix;
    service = name: ./modules/services/${name}.nix;
    program = name: ./modules/programs/${name};
  in [
    (modulesPath + "/installer/scan/not-detected.nix")

    ./hardware-configuration.nix  # 硬件配置

    ./users.nix                   # 用户配置
    ./packages.nix                # 系统软件包
    ./programs.nix                # 系统应用程序

    (share "programs/dae")        # dae 代理配置

    (security "sudo")             # sudo (Switch user, do it)

    (service "ddclient")          # DDClient (DDNS 客户端)
    (service "caddy")             # Caddy (HTTP 服务器)
    (service "netdata")           # Netdata (性能监测器)
    (service "postgresql")        # PostgreSQL (数据库)
    (service "pgadmin")           # pgAdmin (PostgreSQL 管理器)
    (service "n8n")               # n8n (自动化平台)
    (service "navidrome")         # Navidrome (流媒体音乐服务)

    (program "fish")              # Fish (交互式 Shell)
  ];

  # Nix 配置
  nix.settings = {
    # 启用实验性功能
    experimental-features = [ "nix-command" "flakes" ];
  };

  # 机密配置
  sops = {
    defaultSopsFile = ../../secrets/default.json;
    age = {
      # keyFile = "/var/lib/sops/age-key.txt";
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    };

    secrets = {
      "ddclient/cloudflare/password" = {};
    };
  };

  # Bootloader
  boot.loader.grub = {
    # devices = [ ];
    efiSupport = false;
    efiInstallAsRemovable = false;
  };

  # 网络连接
  networking = {
    networkmanager.enable = true;
    useDHCP = false;

    defaultGateway = "192.168.2.1";
    nameservers = [ "223.5.5.5" "1.1.1.1" "2400:3200::1" "2606:4700:4700::1111" ];
    interfaces.enp0s31f6 = {
      ipv4.addresses = [
        {
          address = "192.168.2.201";
          prefixLength = 24;
        }
      ];
    };
  };

  # OpenSSH
  services.openssh = {
    enable = true;
    settings = {
      # PermitRootLogin = "yes";
      # PasswordAuthentication = true;
      PubkeyAuthentication = true;
    };
  };

  system.stateVersion = "25.05";
}
