# flake.nix
{
  description = "A very basic flake";

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, nur, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { 
      inherit system; 
      overlays = [
        (final: prev: { stable = import nixpkgs-stable { inherit system; config.allowUnfree = true; };})
	      nur.overlays.default
      ];
      config.allowUnfree = true;
    };
    vars = import ./vars.nix;
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	  specialArgs = { inherit inputs system pkgs vars; };
      modules = [
	      ./configurations/hosts/${vars.host}/configuration.nix
	    ];
    };
  };
}