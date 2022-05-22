{ config, pkgs, ... }: {
  home.packages = [
    networkmanager-openvpn
    networkmanagerapplet
    openvpn
  ];
}