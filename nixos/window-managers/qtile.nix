{ pkgs, ... }:

{
  imports = [
    ../xorg.nix
  ];

  environment.systemPackages = [
    pkgs.qtile
  ];
}
