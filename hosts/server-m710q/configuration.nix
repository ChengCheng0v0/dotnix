{ modulesPath, lib, pkgs, ... }:

{
  # 主机名
  networking.hostName = "server-m710q";

  # 允许非自由软件
  nixpkgs.config.allowUnfree = true;

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    ./disk-config.nix
    ./hardware-configuration.nix
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
      # keyFile = "/var/lib/sops/age-key.txt";
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    };

    secrets = {
      "proxySubscriptions/catnet/website" = {};
      "proxySubscriptions/catnet/link" = {};
    };
  };

  # Bootloader
  boot.loader.grub = {
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  # 网络连接
  networking = {
    networkmanager.enable = true;

    defaultGateway = "192.168.2.1";
    nameservers = [ "223.5.5.5" "1.1.1.1" "8.8.8.8" ];
    interfaces.enp0s31f6 = {
      ipv4.addresses = [
        {
          address = "192.168.2.3";
          prefixLength = 24;
        }
      ];
    };
  };

  # 代理
  networking.proxy.default = "http://192.168.2.10:7890";
  networking.proxy.noProxy = "127.0.0.1,localhost";

  # OpenSSH
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
      PasswordAuthentication = true;
    };
  };

  # 系统软件包
  environment.systemPackages = with pkgs; [
    curl
    git
  ];

  users.users.root.password = ":)";

  system.stateVersion = "25.05";
}
