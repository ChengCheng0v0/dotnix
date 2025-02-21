{
  description = "awa";

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

  outputs = inputs@{ self, nixpkgs, sops-nix, disko, home-manager, catppuccin, ... }: {
    nixosConfigurations = {
      Cheng-NixOS-PC = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; } // { vars = (import ./vars.nix).Cheng-NixOS-PC; };
        modules = [
          ./hosts/Cheng-NixOS-PC/configuration.nix

          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; } // { vars = (import ./vars.nix).Cheng-NixOS-PC; };

              sharedModules = [
                inputs.sops-nix.homeManagerModules.sops
                inputs.catppuccin.homeManagerModules.catppuccin
              ];

              users = {
                chengcheng_0v0 = import (./home + "/chengcheng_0v0@Cheng-NixOS-PC");
              };
            };
          }
          catppuccin.nixosModules.catppuccin
        ];
      };
      server-m710q = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; } // { vars = (import ./vars.nix).server-m710q; };
        modules = [
          ./hosts/server-m710q/configuration.nix

          sops-nix.nixosModules.sops
          disko.nixosModules.disko
        ];
      };
    };
  };
}
