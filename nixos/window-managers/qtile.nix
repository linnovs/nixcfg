{ config, lib, ... }:
let
  cfg = config.windowManagers.qtile;
in
{
  config = lib.mkIf cfg {
    services = {
      xserver.windowManager.qtile = {
        enable = true;
        backend = "x11";
      };
    };
  };
}
