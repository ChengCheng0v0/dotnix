{
  programs.spotify-player = {
    enable = true;
    settings = {
      client_id = "e63e1cea598c4be1b158e5aca12ec0ed";
      # default_device = "Cheng-NixOS-PC";
    };
  };

  catppuccin.spotify-player = {
    enable = true;
  };
}
