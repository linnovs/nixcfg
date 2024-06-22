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

  outputs = inputs @ { nixpkgs, nixpkgs-unstable, home-manager, ... }: {
    nixosConfigurations = {
      # my main PC
      # yuxuyin = mylib.nixosSystem {
      #   inherit inputs pkgs-unstable;
      #   stateVersion = "23.11";
      #   system = "x86_64-linux";
      #   nixos-modules = baseModules;
      #   home-modules = baseHomeModules;
      # };

      # qemu testing machine
      moliuli = nixpkgs.lib.nixosSystem
        {
          system = "x86_64-linux";
          modules = [
            ./nixos

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = inputs // { stateVersion = "23.11"; };
              home-manager.users.linnovs.imports = [ ./home ];
            }

            { _module.args = { stateVersion = "23.11"; }; }
          ];
        };
    };
  };
}
