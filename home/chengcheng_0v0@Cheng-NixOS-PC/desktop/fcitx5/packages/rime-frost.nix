{
  stdenv, lib, fetchFromGitHub,
  librime
}:

stdenv.mkDerivation {
  pname = "rime-frost";
  version = "0.0.5";

  src = fetchFromGitHub {
    owner = "gaboolic";
    repo = "rime-frost";
    rev = "0.0.5";
    hash = "sha256-m85GZYOvO9Byhj5oq5Ts+ktd+GAIxAV5c0NtKKAXeLs=";
  };

  installPhase = ''
    mkdir -p $out/share/fcitx5/rime
    cp -r $src/* $out/share/fcitx5/rime
    ${librime}/bin/rime_deployer --build $out/share/fcitx5/rime
  '';

  meta = {
    description = "The frost dictionary is currently the best open-source dictionary under the Rime scheme, aiming to create an input experience that is on par with commercial input methods.";
    homepage = "https://github.com/gaboolic/rime-frost";
    license = lib.licenses.gpl3;
  };
}
