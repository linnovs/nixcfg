{ lib, ... }:

{
  imports =
    [
      ../default.nix
      ./hardware-configuration.nix # hardware configuration for the qemu system
    ];

  users.users.linnovs.openssh.authorizedKeys.keys = lib.mkForce [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDIjRPXhIGrNUtCIdlzEoDmSq8tvAnPKtlnAgkH1//Ho linnovs@blazarmist"
  ];

  networking.hostName = "moliuli";
}
