{
  description = "ChengCheng's NixOS configuration! <3";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    sops-nix.url = "github:Mic92/sops-nix/master";
    disko.url = "github:nix-community/disko/master";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix/main";
  };

  outputs = inputs@{ self, nixpkgs, sops-nix, disko, home-manager, catppuccin, ... }: let
    mkSpecialArgs = { hostname, extra ? { } }: { inherit inputs; } // { vars = (import ./vars.nix).hosts.${hostname}; } // extra;
    mkHost = { hostname, extraModules ? [ ], extraSpecialArgs ? { } }: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = mkSpecialArgs { hostname = hostname; extra = extraSpecialArgs; };
      modules = [ ./hosts/${hostname}/configuration.nix ] ++ extraModules;
    };
  in {
    nixosConfigurations = {
      Cheng-NixOS-PC = mkHost rec {
        hostname = "Cheng-NixOS-PC";
        extraModules = [
          (import ./overlays)

          sops-nix.nixosModules.sops
          catppuccin.nixosModules.catppuccin

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = mkSpecialArgs { hostname = hostname; };
              sharedModules = [
                sops-nix.homeManagerModules.sops
                catppuccin.homeManagerModules.catppuccin
              ];
              users = {
                chengcheng_0v0 = import ("${./home}/chengcheng_0v0@${hostname}");
              };
            };
          }
        ];
      };

      vm-m710q-server = mkHost {
        hostname = "vm-m710q-server";
        extraModules = [
          sops-nix.nixosModules.sops
          disko.nixosModules.disko
        ];
      };
    };
  };
}
