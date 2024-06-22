{ config, lib, ... }:
let
  cfg = config.windowManagers.qtile;
in
{
  options = {
    windowManagers.qtile = lib.mkOption {
      default = false;
      type = lib.types.bool;
    };
  };

  config = lib.mkIf cfg {
    services = {
      xserver.windowManager.qtile = {
        enable = true;
        backend = "x11";
      };
    };
  };
}
