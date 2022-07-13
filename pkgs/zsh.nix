{ config, pkgs, ... }: {
  imports = [ 
    ../dotfiles/fzf/default.nix
    ../dotfiles/zsh/default.nix
    ];
  
  home.packages = with pkgs; [ tmux ];
  programs.bat.enable = true;
  programs.zsh.enable = true;
}
