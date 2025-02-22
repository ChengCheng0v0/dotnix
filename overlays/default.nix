{ lib, ... }:

let
  excludes = [
    ./default.nix
  ];
in {
  nixpkgs.overlays = builtins.map import (
    builtins.filter (x: !(builtins.elem x excludes)) (lib.filesystem.listFilesRecursive ./.)
  );
}
