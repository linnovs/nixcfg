{ config, lib, ... }:
{
  options = {
    windowManagers = {
      qtile = lib.mkOption
        {
          default = false;
          type = lib.types.bool;
        };
    };
  };

  imports = [ ]
    ++ lib.optionals (config.windowManagers.qtile) [ ./qtile.nix ];
}
