{ config, ... }: {
  imports = [ ../dotfiles/fzf/default.nix ];

  programs.fzf.enable = true;
  programs.zsh.enable = true;
}