{ pkgs, utils, theme, ... }:
let
  sway-theme = utils.mustache "sway-theme" ../dotfiles/sway/theme.mustache theme;
  sway-apps = utils.mustache "sway-apps" ../dotfiles/sway/apps.mustache {
    term = "alacritty";
    browser = "firefox";
  };
in
{
  xdg.configFile =
    {
      "sway/keys".source = ../dotfiles/sway/keys;
      "sway/theme".source = sway-theme;
      "sway/apps".source = sway-apps;
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
