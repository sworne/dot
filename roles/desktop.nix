{ ... }: {
  imports = [
    ./dwm.nix
    ../pkgs/xsecurelock.nix
    ../pkgs/vpn.nix
    ../pkgs/spotify.nix
    ../pkgs/media.nix
    ../pkgs/photos.nix
    ../pkgs/gtk.nix
    ../pkgs/default.nix
  ];
}
