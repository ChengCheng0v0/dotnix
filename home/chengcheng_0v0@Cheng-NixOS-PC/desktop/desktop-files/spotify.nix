{
  xdg.desktopEntries.spotify = {
    type = "Application";
    name = "Spotify";
    genericName = "Music Player";
    icon = "spotify-client";
    exec = "spotify --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime %U";
    terminal = false;
    mimeType = ["x-scheme-handler/spotify"];
    categories = [ "Audio" "Music" "Player" "AudioVideo" ];

    settings = {
      TryExec = "spotify";
      StartupWMClass = "spotify";
    };
  };
}
