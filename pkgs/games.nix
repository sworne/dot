{ config, pkgs, ... }: {
    home.packages = with pkgs; [
    discord
    jdk11
    legendary-gl
    libjpeg
    libpng
    libuv
    libvorbis
    lutris
    mbedtls
    minecraft
    openal
    playonlinux
    SDL2
    wine
    winetricks
   ];
   xdg.configFile."sunshine/apps.json".text = builtins.toJSON {
    env = "/run/current-system/sw/bin";
        apps = [
            {
                name = "Baldur's Gate 3";
                output = "bg3.txt";
                detached = ["${pkgs.util-linux}/bin/setsid ${pkgs.steam}/bin/steam steam://rungameid/1086940"];
                image-path = "/var/tmp/bg3.png";
            }
        ];
    };
}
