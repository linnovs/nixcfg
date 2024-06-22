{ config, pkgs, lib, ... }:
let
  enableXorg = config.windowManagers.qtile;
in
{
  config = lib.mkIf enableXorg {
    services.xserver.enable = true;

    displayManager.sddm = {
      enable = true;
      autoNumlock = true;
      theme = "catppuccin-macchiato";
      package = pkgs.kdePackages.sddm;
    };

    environment.systemPackages = [
      (pkgs.catppuccin-sddm.override {
        flavor = "macchiato";
        font = "Noto Sans";
        fontSize = "9";
      })
    ];
  };
}
