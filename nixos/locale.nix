{ pkgs, ... }:

{
  i18n.defaultLocale = "en_US.UTF-8";

  fonts = {
    packages = with pkgs; [
      font-awesome

      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji

      jetbrains-mono

      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "JetBrains Mono" "NerdFontsSymbolsOnly" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
