{ config, pkgs, ... }: {
    programs.rofi.enable = true;
    programs.rofi.theme = ../rofi/blur.rasi;
}