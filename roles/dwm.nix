{ ... }: {
  imports = [
    ./default.nix
    ../pkgs/default.nix
    ../pkgs/dwm.nix
    ../pkgs/gtk.nix
    ../pkgs/picom.nix
    ../pkgs/redshift.nix
    ../pkgs/st.nix
    ../pkgs/sxhkd.nix
    ../pkgs/xsecurelock.nix
  ];
}
