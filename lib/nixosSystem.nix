{ inputs, pkgs-unstable, stateVersion, system, nixos-modules, home-modules, ... }:
let
  inherit (inputs) nixpkgs home-manager;
in
nixpkgs.lib.nixosSystem {
  inherit system;

  modules =
    nixos-modules
    ++ [
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = inputs // { inherit stateVersion; };
        home-manager.users.linnovs.imports = home-modules;
      }

      {
        _module.args = { inherit inputs pkgs-unstable; };
      }
    ];
}
