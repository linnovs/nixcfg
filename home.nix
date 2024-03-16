{ config, pkgs, ... }:

{
  home.username = "linnovs";
  home.homeDirectory = "/home/linnovs";

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.stateVersion = "23.11";
}
