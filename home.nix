{ config, pkgs, ... }: {
  imports = [
    ./dwm/dwm.nix
    ./nix/redshift.nix 
    ./nix/spotify.nix
    ./nix/vscode.nix 
    ./nix/zsh.nix
    ./nix/fzf.nix
    ./nix/lockscreen.nix
    ./picom/picom.nix
    ./rofi/rofi.nix
    ./st/st.nix
    /etc/nixos/nix/secrets/secrets.nix
  ];
  
  home = {
    sessionVariables = { EDITOR = "nano"; };
  };
}
