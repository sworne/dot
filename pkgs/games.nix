{ config, pkgs, ... }: {
    home.packages = with pkgs; [
    discord
    jdk11
    legendary-gl
    libjpeg
    libpng
    libuv
    libvorbis
    #lutris
    mbedtls
    minecraft
    openal
    playonlinux
    SDL2
    steam
    steam-run
    wine
    winetricks
    wineWowPackages.full
   ];
}
