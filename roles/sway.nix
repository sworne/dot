{ ... }: {
  imports = [
    ./default.nix
    ../pkgs/sway.nix
    ../pkgs/swaylock.nix
    ../pkgs/gtk.nix
    ../pkgs/redshift.nix
    ../pkgs/alacritty.nix
  ];
}
