{ pkgs, ... }:

{
  boot = {
    loader.systemd-boot.enable = true;
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

  environment.systemPackages = with pkgs;
    [
      git
      neovim
      wget
      curl
    ];
  environment.variables.EDITOR = "nvim";



  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
