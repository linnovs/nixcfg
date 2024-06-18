{ ... }:

{
  imports = [
    ../xorg.nix
  ];

  services.xserver.windowManager.qtile = {
    enable = true;
    backend = "x11";
  };
}
