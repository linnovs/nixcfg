{ inputs, username, system, nixos-modules, home-modules, ... }:
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
        home-manager.extraSpecialArgs = inputs;
        home-manager.users."${username}".imports = home-modules;
      }

      {
        _module.args = { inherit inputs; };
      }
    ];
}
