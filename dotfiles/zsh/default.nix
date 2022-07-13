{ config, pkgs, ... }: {
  programs.zsh = {
    shellAliases = {
      ls = "ls -1hs --group-directories-first --file-type --color=alway";
      meh = "feh --scale-down --auto-zoom";
      pause = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause";
      play = "pause";
      next = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next";
      prev = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous";
    };
    dirHashes = {
      doc = "$HOME/Documents";
      vid = "$HOME/Videos";
      dl = "$HOME/Downloads";
    };
    history.size = 100000;
    initExtra = "if [ -f ~/.zshwork ]; then . ~/.zshwork; fi";
    enableSyntaxHighlighting = false;
    prezto = {
      enable = true;
      extraConfig = ''
        zstyle ':completion:*' users
      '';
      prompt.theme = "walters";
    };
  };
}