{ config, pkgs, ... }: {
  home.packages = [ pkgs.nixpkgs-fmt pkgs.diffutils pkgs.gopls ];
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        golang.go
        haskell.haskell
        jnoortheen.nix-ide
        dbaeumer.vscode-eslint
        naumovs.color-highlight
        naumovs.color-highlight
        yzhang.markdown-all-in-one
        arcticicestudio.nord-visual-studio-code
        dracula-theme.theme-dracula
        viktorqvarfordt.vscode-pitch-black-theme
        zhuangtongfa.material-theme
        tobiasalthoff.atom-material-theme
      ];
    };
  };
}
