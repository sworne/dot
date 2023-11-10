{
  description = "sworne@ hm config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    secrets = {
      url = "git+ssh://git@github.com/sworne/sec.git?ref=main";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, secrets, ... }@inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations = {
        dot = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {inherit inputs outputs secrets;};
          modules = [
            ./default.nix
            ./roles/default.nix
            ./roles/sway.nix
          ];
        };
      };
    };
}



