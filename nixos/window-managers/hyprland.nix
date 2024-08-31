{ config, lib, inputs, pkgs ... }:
let
  cfg = config.windowManagers.hyprland;
in
{
  config = lib.mkIf cfg {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.package.${pkgs.stdenv.hostPlatform.system}.hyprland;
    };
  };
}
