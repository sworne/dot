{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    bitwarden
    bitwarden-cli
    firefox-wayland
    imagemagick
    irssi
    libnotify
    linuxPackages.v4l2loopback
    signal-cli
    signal-desktop
    xorg.xev
  ];
}
