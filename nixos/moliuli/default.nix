{ ... }:

{
  imports =
    [
      ../default.nix
      ./hardware-configuration.nix # hardware configuration for the qemu system
    ];

  networking.hostName = "moliuli";
}
