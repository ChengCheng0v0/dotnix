self: super: let
  package = (
    { lib, rustPlatform, fetchFromGitHub }:

    rustPlatform.buildRustPackage rec {
      pname = "dotnix.wallpaper_picker";
      version = "v0.1.0";

      src = fetchFromGitHub {
        owner = "ChengCheng0v0";
        repo = pname;
        rev = version;
        hash = "sha256-bAmoyc0xzHnGuaaI9F2eTSEAptkCVpYGZQ0QwpccDn0=";
      };

      useFetchCargoVendor = true;
      cargoHash = "sha256-uRjMX/Eyx1LZ87EEymJglXlUwOiEu2BA11D2PhMMrhU=";

      meta = with lib; {
        description = "A simple Rofi-based wallpaper picker for my NixOS configuration.";
        license = licenses.unlicense;
        maintainers = [ maintainers.ChengCheng0v0 ];
      };
    }
  );
in {
  dotnix.wallpaper_picker = super.callPackage package { };
}
