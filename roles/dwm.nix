{ ... }: {
  imports = [
    ./default.nix
    ../pkgs/dwm.nix
    ../pkgs/gtk.nix
    ../pkgs/picom.nix
    ../pkgs/redshift.nix
    ../pkgs/alacritty.nix
    ../pkgs/sxhkd.nix
  ];
}
