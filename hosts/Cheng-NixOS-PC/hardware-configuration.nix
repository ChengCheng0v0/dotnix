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
  };

  # Swap
  swapDevices = [
    { device = "/dev/disk/by-uuid/cf1a87f8-5780-41ac-afcf-04119336e4b4"; }
  ];

  # 启用 DHCP
  networking.useDHCP = lib.mkDefault true;

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
