{ config, pkgs, ... }:

{
  home.username = "linnovs";
  home.homeDirectory = "/home/linnovs";

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs; [
    neofetch

    # archives
    zip
    xz
    unzip
    p7zip

    ripgrep #  recursively searches directories for a regex pattern
    jq # a command-line JSON parser
    eza # modern replacement for 'ls'
    fzf # a command-line fuzzy finder
    lazygit # a simple TUI for git

    btop # replacement for htop
    lsof # list open files

    file
    tree
    which
    gnupg
    gnutar

    util-linux # lsblk, etc.
    pciutils # lspci
    usbutils # lsusb
  ];

  home.stateVersion = "23.11";
}
