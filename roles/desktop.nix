{ ... }: {
  imports = [
    ../pkgs/default.nix
    ../pkgs/gtk.nix
    ../pkgs/media.nix
    ../pkgs/photos.nix
    ../pkgs/spotify.nix
    ../pkgs/vpn.nix
    ../pkgs/vscode.nix
    ../pkgs/xsecurelock.nix
    ./dwm.nix
  ];
}
