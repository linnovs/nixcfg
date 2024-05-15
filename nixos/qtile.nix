{ ... }:

{
  services.xserver = {
    enable = true;

    desktopManager.xterm.enable = false;

    displayManager.lightdm = {
      enable = true;
    };
  };
}
