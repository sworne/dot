{ ... }: {
  imports = [
    ../pkgs/fzf.nix
    ../pkgs/zsh.nix
  ];

  home.packages = with pkgs; [
    signal-cli
    bitwarden-cli
  ];
}
