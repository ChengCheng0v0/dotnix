{
  services.navidrome = {
    enable = true;
    openFirewall = true;
    settings = {
      Address = "0.0.0.0";
      MusicFolder = "/data/navidrome/music";
      DataFolder = "/data/navidrome/data";
    };
  };
}
