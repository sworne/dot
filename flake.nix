{
  description = "sworne@ hm config";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    secrets = {
      url = "git+ssh://git@github.com/sworne/sec.git?ref=main";
      flake = false;
    };
  };

  outputs = { home-manager, ... }@attrs:
    {
      dwm = import ./roles/dwm.nix;
      tty = import ./roles/tty.nix;
    };
}


