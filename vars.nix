rec {
  defaults = {
    nixOsConfigPath = "/etc/nixos";
  };

  hosts = {
    Cheng-NixOS-PC = {
      nixOsConfigPath = defaults.nixOsConfigPath;

      dae = {
        nodeName = "日本 03 | 深港专线";
      };

      home = {
        chengcheng_0v0 = {
          wallpapers = {
            linkTarget.picture = "Pictures/Wallpapers";
            linkTarget.video = "Videos/Wallpapers";
          };
        };
      };
    };
    server-m710q = {
      nixOsConfigPath = defaults.nixOsConfigPath;

      dae = {
        nodeName = "日本 04 | 深港专线";
      };
    };
  };
}
