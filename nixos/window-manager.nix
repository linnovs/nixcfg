{ pkgs-unstable, ... }:

{
  services.xserver = {
    enable = true;

    desktopManager.xterm.enable = false;

    displayManager.sddm = {
      enable = true;
      autoNumlock = true;
      theme = "catppuccin-macchiato";
    };
  };

  environment.systemPackages = [
    (pkgs-unstable.catppuccin-sddm.override {
      flavor = "macchiato";
      font = "Noto Sans";
      fontSize = 12;
    })
  ];
}
