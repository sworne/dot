{ config, pkgs, ... }: {
  imports = [
    ./nix/zsh.nix
    ./nix/spotify.nix
    ./nix/vscode.nix 
    ./nix/redshift.nix 
    ./rofi/rofi.nix
    ./st/st.nix
    ./dwm/dwm.nix
    ./picom/picom.nix
    /etc/nixos/nix/secrets/secrets.nix
  ];
  
  home = {
    sessionVariables = { EDITOR = "nano"; };
  };
}
