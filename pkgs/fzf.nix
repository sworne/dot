{ config, pkgs, ... }: 
let
  runcmd = pkgs.writeScriptBin "run" (builtins.readFile ../dotfiles/fzf/run.sh);

in {
  home.packages = [ runcmd ];
  programs = {
    fzf = {
      enable = true;
      defaultOptions = [
        "--reverse"
        "--border top"
        "--pointer -"
        "--no-info"
        # "--header ' '"
        ''
          --color='fg:white,bg:black,preview-fg:white,preview-bg:black' \
          --color='hl:yellow,fg+:white,bg+:black,gutter:black,hl+:yellow' \
          --color='query:white,prompt:white,pointer:white,marker:white'
          ''
      ];
    };
    zsh = {
      enable = true;
      shellAliases = {
        cfg =
          ''
            find ~/dot /etc/nixos -type f -not -path '*/\.git/*' -print | 
            fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' | 
            xargs -r codium
          '';
        search =
          ''
            nix-instantiate --eval --json -E 'builtins.attrNames (import <nixpkgs> {})' | 
            jq '.[]' -r | fzf --preview-window wrap --preview 'nix-env --description -f "<nixpkgs>" -qaA {}' | 
            xargs -I {} nix-env -f '<nixpkgs>' -iA {}
          '';
      };
    };
  };
}
