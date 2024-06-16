{ ... }:

{
  imports = [
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

  networking.hostName = "moliuli";
}
