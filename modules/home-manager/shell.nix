{
  ...
}:
{
  programs = {
    bash = {
      enable = true;

      historyControl = [ "ignoreboth" ];
      historySize = 1000;
      historyFileSize = 2000;

      shellOptions = [
        "histappend"
        "globstar"
        "autocd"
        "checkwinsize"
      ];

      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#desktop";
        ls = "ls --color=auto";
        dir = "dir --color=auto";
        vdir = "vdir --color=auto";

        grep = "grep --color=auto";
        fgrep = "fgrep --color=auto";
        egrep = "egrep --color=auto";

        ll = "ls -l";
        la = "ls -A";
        l = "ls -CF";
        c = "clear";
        cp = "cp -i";
        mv = "mv -i";
        rm = "trash-put";
      };

      initExtra = ''
        bind '"\e[A": history-search-backward'
        bind '"\e[B": history-search-forward'

        set -o noclobber

        if [ -f "$HOME/.bash_aliases" ]; then
          source "$HOME/.bash_aliases"
        fi
      '';
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
    };

    command-not-found.enable = true;
  };
}
