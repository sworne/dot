{ config, pkgs, ... }: {
  home.packages = with pkgs;  [
    ffmpeg
    mplayer
    mpv
    vlc
  ];
}
