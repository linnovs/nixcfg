{
  description = "Linnovs's NixOS configuration flake";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      mylib = import ./lib { };
      pkgs-unstable = nixpkgs-unstable;
      baseModules = [ ./nixos ];
      baseHomeModules = [ ./home ];
    in
    {
      nixosConfigurations = {
        # my main PC
        yuxuyin = mylib.nixosSystem {
          inherit inputs pkgs-unstable;
          stateVersion = "23.11";
          system = "x86_64-linux";
          nixos-modules = baseModules;
          home-modules = baseHomeModules;
        };

        # qemu testing machine
        moliuli = mylib.nixosSystem {
          inherit inputs pkgs-unstable;
          stateVersion = "23.11";
          system = "x86_64-linux";
          nixos-modules = baseModules ++ [ ./nixos/window-managers/qtile.nix ./hosts/moliuli ];
          home-modules = baseHomeModules;
        };
      };
    };
}
