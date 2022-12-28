{ pkgs, utils, theme, ... }:
let
  keys = (builtins.readFile ../dotfiles/sway/keys);
  theme = utils.mustache "theme" ../dotfiles/sway/theme.mustache theme;
  apps = utils.mustache "apps" ../dotfiles/sway/apps.mustache {
    term = "alacritty";
    browser = "firefox";
  };
in
{
  xdg.configFile =
    {
      "sway/keys".source = ../dotfiles/sway/keys;
      "sway/theme".source = theme;
      "sway/apps".source = apps;
    };
  wayland.windowManager.sway = {
    enable = true;
    extraConfigEarly = ''
      include keys
      include theme
      include apps
    '';
    extraConfig = (builtins.readFile ../dotfiles/sway/config);
  };
}
