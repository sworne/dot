{
  description = "sworne@ hm configuration";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { home-manager, ... }:
    {
        dwm = import ./roles/dwm.nix;
        tty = import ./roles/tty.nix;
    };
}


