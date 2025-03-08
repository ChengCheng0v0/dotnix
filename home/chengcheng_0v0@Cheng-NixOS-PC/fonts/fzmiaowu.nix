{ stdenv, lib }:

stdenv.mkDerivation {
  pname = "fzmiaowu";
  version = "";

  src = ./source/FZMiaoWuS-GB-Regular.ttf;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    cp $src $out/share/fonts/truetype
  '';

  phases = ["installPhase"];

  meta = {
    description = "";
    homepage = "";
    license = lib.licenses.ofl;
    maintainers = with lib.maintainers; [  ];
  };
}
