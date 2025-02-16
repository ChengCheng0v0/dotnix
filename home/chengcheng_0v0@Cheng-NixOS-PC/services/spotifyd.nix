{ config, lib, pkgs, ... }:

{
  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        device_name = "Cheng-NixOS-PC";
        device_type = "computer";
      };
    };

    package = let
      withPipe = true;
      withALSA = true;
      withJack = true;
      withPulseAudio = true;
      withPortAudio = true;
      withMpris = true;
      withKeyring = false;
    in pkgs.rustPackages.rustPlatform.buildRustPackage rec {
      pname = "spotifyd";
      version = "oauth_support-latest";

      src = pkgs.fetchFromGitHub {
        owner = "Spotifyd";
        repo = "spotifyd";
        rev = "82f633d50e8f4959233466481654768c1c73f449";
        hash = "sha256-Y8JgPSTKeu0V9kCZCN1PpHSbOFUk6HzNfjLTzPtPRsc=";
      };

      useFetchCargoVendor = true;
      cargoHash = "sha256-bTksZC0J+5u2s22wwUioIjS38C17Ii//tNe78R7tH94=";

      nativeBuildInputs = [ pkgs.pkg-config ];

      buildInputs = lib.optionals pkgs.stdenv.hostPlatform.isLinux [ pkgs.openssl ]
        ++ lib.optional (withALSA || withJack) pkgs.alsa-lib
        ++ lib.optional withJack pkgs.libjack2
        ++ lib.optional withPulseAudio pkgs.libpulseaudio
        ++ lib.optional withPortAudio pkgs.portaudio
        ++ lib.optional ((withMpris || withKeyring) && pkgs.stdenv.hostPlatform.isLinux) pkgs.dbus;

      buildNoDefaultFeatures = true;
      buildFeatures = lib.optional withALSA "alsa_backend"
        ++ lib.optional withJack "rodiojack_backend"
        ++ lib.optional withPulseAudio "pulseaudio_backend"
        ++ lib.optional withPortAudio "portaudio_backend"
        ++ lib.optional withMpris "dbus_mpris"
        ++ lib.optional withPipe "pipe_backend"
        ++ lib.optional withKeyring "dbus_keyring";

      doCheck = false;

      passthru = {
        tests.version = pkgs.testers.testVersion {
          package = pkgs.spotifyd;
          version = builtins.head (lib.splitString "-" version);
        };
        updateScript = pkgs.nix-update-script { extraArgs = [ "--version=branch" ]; };
      };

      meta = {
        description = "Open source Spotify client running as a UNIX daemon";
        homepage = "https://spotifyd.rs/";
        changelog = "https://github.com/Spotifyd/spotifyd/blob/${src.rev}/CHANGELOG.md";
        license = lib.licenses.gpl3Plus;
        maintainers = with lib.maintainers; [
          anderslundstedt
          Br1ght0ne
          getchoo
        ];
        platforms = lib.platforms.unix;
        mainProgram = "spotifyd";
      };
    };
  };
}
