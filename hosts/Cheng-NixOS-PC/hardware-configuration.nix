{ config, lib, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # Bootloader
  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "uas" "sd_mod" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  # 文件系统
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/300aceb8-6097-47d0-8e49-cfa4e6b975bb";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/D9E7-4338";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

    "/home/chengcheng_0v0/data" = {
      device = "/dev/disk/by-uuid/4a0f26fa-3cf5-4ee2-a555-3f45c59446b1";
      fsType = "btrfs";
    };
  };
  systemd.tmpfiles.rules = [
    "d /home/chengcheng_0v0/data 0755 chengcheng_0v0 users -"
  ];

  # Swap
  swapDevices = [
    { device = "/dev/disk/by-uuid/cf1a87f8-5780-41ac-afcf-04119336e4b4"; }
  ];

  # 禁用 DHCP
  networking.useDHCP = lib.mkDefault false;

  # 硬件平台
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # CPU 微码
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # NVIDIA
  hardware.graphics.enable = true; # OpenGL
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    open = false;
    nvidiaSettings = true;
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };
}
