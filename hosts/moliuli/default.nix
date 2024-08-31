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

  windowManagers.qtile = true;
  windowManagers.hyprland = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
