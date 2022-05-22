{ ... }: {
  imports = [
    ../pkgs/dwm.nix         # Window manager
    ../pkgs/fzf.nix         # Launcher
    ../pkgs/picom.nix       # Compositor
    #../pkgs/redshift.nix    # Blue light filter
    ../pkgs/st.nix          # Terminal
    ../pkgs/sxhkd.nix       # Keyboard shortcuts
    ../pkgs/xsecurelock.nix # Lockscreen
    ../pkgs/default.nix # Lockscreen
    ../pkgs/vscode.nix # Lockscreen
    ../pkgs/zsh.nix # Lockscreen
    ../pkgs/media.nix # Lockscreen
  ];
}
