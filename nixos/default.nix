{ pkgs, lib, ... }:

{
  imports = [
    ./users.nix
    ./locale.nix
    ./services.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = false;
  };

  networking.networkmanager.enable = true;

  time.timeZone = "Aisa/Hong_Kong";

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "linnovs" ];
    };

    gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly";
      options = lib.mkDefault "--delete-older-than 7d";
    };
  };

  environment = {
    systemPackages = with pkgs; [
      git
      neovim
      wget
      curl
    ];

    variables.EDITOR = "nvim";
  };

  security.polkit.enable = true;
}
