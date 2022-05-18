{ pkgs, ... }: {
  programs.zsh.profileExtra = "fbsetroot  -fg '#001633' -bg '#000f20' -mod 100 100";
  services = {
    dwm-status = {
      enable = true;
      order = [ "time" ];
      };
    sxhkd = {
      enable = true;
      extraConfig = builtins.readFile ../sxhkd/dwm;
    };
  };
  home.file.dwm-keys = {
    source = ./keys.md;
    target = ".dwm-keys.md";
  };
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    pkgs.jetbrains-mono #dwm main font
    pkgs.material-icons #dwm icon font
    pkgs.fluxbox #for fbsetroot
    pkgs.glow #dwm keyboard shortuct help
    (import ./base.nix)
  ];
}
