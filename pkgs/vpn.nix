{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    networkmanager-openvpn
    networkmanagerapplet
    openvpn
  ];
}