{ pkgs, ... }: let themes = import ../config/themes.nix; in {
  imports = [
    ../pkgs/fzf.nix
    ../pkgs/zsh.nix
  ];

  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "23.05";
  home.manual.manpages.enable = false;
  _module.args = {
    utils = import ../utils { inherit pkgs; };
    theme = themes.theme.navy;
  };
}
