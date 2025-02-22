{
  hosts = {
    Cheng-NixOS-PC = {
      dae = {
        nodeName = "日本 03 | 深港专线";
      };
      home = {
        chengcheng_0v0 = {
          wallpapers = {
            assetsPath.picture = "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/wallpapers/picture";
            linkTarget.picture = "Pictures/Wallpapers";
            assetsPath.video = "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/wallpapers/video";
            linkTarget.video = "Videos/Wallpapers";
          };
          waybar = {
            configPath = "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/waybar/config";
          };
          fcitx = {
            configPath = "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/fcitx5/config";
            rimeSharePath = "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/desktop/fcitx5/share/rime";
          };
          qimgv = {
            configPath = "/etc/nixos/home/chengcheng_0v0@Cheng-NixOS-PC/programs/qimgv/config";
          };
        };
      };
    };
    server-m710q = {
      dae = {
        nodeName = "日本 04 | 深港专线";
      };
    };
  };
}
