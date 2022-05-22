{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    spotify
    spotify-tui
    spotify-qt
  ];
  
  services.spotifyd = {
    enable = true;
    settings = {
      username = config.spotify.username;
      password = config.spotify.password;
      backend = "pulseaudio";
      bitrate = 320;
      device_name = "nix";
    };
  };
}
