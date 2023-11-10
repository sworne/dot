{ inputs, lib, config, pkgs, secrets, ... }: let
  themes = import ./config/themes.nix;
  currentTheme = themes.theme.navy;
in {

  _module.args = {
    utils = import ./utils { inherit pkgs; };
    theme = currentTheme;
  };

  nixpkgs = {
    overlays = [ ];
    config.allowUnfree = true;
  };
  
  home = {
    username = "sworne";
    homeDirectory = builtins.readFile "${secrets.outPath}/homedir";
  };

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.05";
  xdg.configFile."bg".source = currentTheme.bg;
}