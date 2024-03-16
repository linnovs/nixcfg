{ config, pkgs, ... }:

{
  home.username = "linnovs";
  home.homeDirectory = "/home/linnovs";

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip

    file
    tree
    which
    gnupg
    gnutar

    util-linux # lsblk, etc.
    pciutils # lspci
    usbutils # lsusb
  ];

  home.stateVersion = "23.11";
}
