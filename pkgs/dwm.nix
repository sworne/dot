{ pkgs, ... }: {
  programs.zsh.profileExtra = "fbsetroot  -fg '#001633' -bg '#000f20' -mod 100 100";
  services = {
    dwm-status = {
      enable = true;
      order = [ "time" ];
    };
    sxhkd = {
      enable = true;
      extraConfig = builtins.readFile ../dotfiles/sxhkd/dwm;
    };
  };
  home.file.dwm-keys = {
    source = ../dotfiles/dwm/keys.md;
    target = ".dwm-keys.md";
  };
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    fluxbox #for fbsetroot
    glow #dwm keyboard shortuct help
    jetbrains-mono #dwm main font
    material-icons #dwm icon font
    scrot
    xfce.thunar
    pavucontrol
    (import ../dotfiles/dwm/defualt.nix)
  ];
}
