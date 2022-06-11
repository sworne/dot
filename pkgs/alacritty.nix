{ pkgs, utils, theme, ... }: let
  customSt = import ../dotfiles/st/default.nix;
  alacritty-conf = utils.mustache "alacritty-conf" ../dotfiles/alacritty/alacritty.yml.mustache theme;
in
{
    programs.alacritty.enable = true;
    xdg.configFile."alacritty/alacritty.yml".source = alacritty-conf;
}