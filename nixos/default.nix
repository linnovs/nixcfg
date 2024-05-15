{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  networking.networkmanager.enable = true;

  time.timeZone = "Aisa/Hong_Kong";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.trusted-users = [ "linnovs" ];
  nix.gc =
    {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

  environment.systemPackages = with pkgs;
    [
      git
      neovim
      wget
      curl
    ];
  environment.variables.EDITOR = "nvim";

  users.users.linnovs = {
    isNormalUser = true;
    description = "linnovs";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDIjRPXhIGrNUtCIdlzEoDmSq8tvAnPKtlnAgkH1//Ho linnovs@blazarmist"
    ];
  };

  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  services.avahi.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";

  fonts.packages = with pkgs;
    [
      font-awesome

      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji

      jetbrains-mono

      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  fonts.enableDefaultPackages = false;
  fonts.fontconfig.defaultFonts =
    {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "JetBrains Mono" "NerdFontsSymbolsOnly" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
