{
  description = "EdibleInk's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = { self, nixpkgs, spicetify-nix, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations.nixos = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          spicetify-nix.nixosModules.default
          ./nixos/.imports.nix
          ./nixos/clients/nixos/client.nix
        ];
      };
      nixosConfigurations.framework = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          spicetify-nix.nixosModules.default
          ./nixos/.imports.nix
          ./nixos/clients/framework/client.nix
        ];
      };
    };
}
