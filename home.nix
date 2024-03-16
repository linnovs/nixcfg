{ config, pkgs, ... }:

{
  home.username = "linnovs";
  home.homeDirectory = "/home/linnovs";

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs; [
    util-linux # lsblk, etc.
    pciutils # lspci
    usbutils # lsusb
  ];

  home.stateVersion = "23.11";
}
