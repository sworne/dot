{ ... }: {
  imports = [
    ./default.nix
    ../pkgs/dwm.nix
    ../pkgs/gtk.nix
    ../pkgs/redshift.nix
    ../pkgs/alacritty.nix
    ../pkgs/sxhkd.nix
  ];
}
