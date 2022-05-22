{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    mprime
    stress-ng
    unigine-valley
  ];
}
