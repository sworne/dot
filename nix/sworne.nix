{ config, pkgs, ... }: {
  imports = [
    ./shell.nix
    ./rofi.nix
  ];
  programs.home-manager.enable = true;
  home = {
    username = "sworne";
    homeDirectory = "/home/sworne";
    stateVersion = "22.05";
    packages = [ pkgs.nixfmt ];
    sessionVariables = { EDITOR = "nano"; };
  };
}
