{
  description = "awa";

  inputs = {
    nixpkg.url = "github:NixOS/nixpkgs/nixos-unstable";
    sops-nix.url = "github:Mic92/sops-nix/master";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, sops-nix, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      Cheng-NixOS-PC = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/Cheng-NixOS-PC/configuration.nix

          sops-nix.nixosModules.sops
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              sharedModules = [
                inputs.sops-nix.homeManagerModules.sops
              ];

              users.chengcheng_0v0 = import (./home + "/chengcheng_0v0@Cheng-NixOS-PC");
            };
          }
        ];
      };
    };
  };
}
