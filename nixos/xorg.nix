{ pkgs, ... }:

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

  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "macchiato";
      font = "Noto Sans";
      fontSize = "9";
    })
  ];
}
