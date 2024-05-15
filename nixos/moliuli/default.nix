{ ... }:

{
  imports = [
    ../default.nix
    ../window-manager.nix
    ./hardware-configuration.nix # hardware configuration for the qemu system
  ];

  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  users.users.linnovs.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDIjRPXhIGrNUtCIdlzEoDmSq8tvAnPKtlnAgkH1//Ho linnovs@blazarmist"
  ];

  networking.hostName = "moliuli";
}
