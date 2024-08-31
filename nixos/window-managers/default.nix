{ lib, ... }:
{
  options = {
    windowManagers.qtile = lib.mkOption {
      default = false;
      type = lib.types.bool;
    };
  };

  imports = [
    ./xorg.nix
    ./qtile.nix
    ./hyprland.nix
  ];
}
