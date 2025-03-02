{
  services.navidrome = {
    enable = true;
    openFirewall = true;
    settings = {
      Address = "0.0.0.0";
      MusicFolder = "/data/navidrome/music";
      DataFolder = "/data/navidrome/data";

      LastFM = {
        ApiKey = builtins.extraBuiltins.getSecret "navidrome/lastFM/apiKey";
        Secret = builtins.extraBuiltins.getSecret "navidrome/lastFM/apiSecret";
      };
    };
  };
}
