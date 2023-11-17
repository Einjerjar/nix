{
  programs.git = {
    extraConfig = {
      alias = {
        aliases = "!git config --get-regexp 'alias.*' | colrm 1 6 | sed 's/[ ]/ = /' | sort";
        c = "checkout";
        b = "branch";
        p = "push";
        s = "status";

        pu = "!git push -u origin $(git rev-parse --abbrev-ref HEAD)";
        cb = "checkout -b";
        db = "branch -d";
        mb = "branch -m";

        ls = "log --graph --pretty=format:'%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]'";
        ll = "log --pretty=format:'%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]' --decorate --numstat";
        lds = "log --pretty=format:'%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]' --decorate --date=short";
        ld = "log --pretty=format:'%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]' --decorate --date=relative";
        le = "log --oneline --decorate";

        fl = "log -u";
        dl = "!git ll -1";
        dlc = "diff --cached HEAD^";
        dlcc = "diff --cached";

        ff = "!git ls-files | fzf";
        gr = "grep -Ii";

        st = "stash";
        sp = "stash push -m";
        sl = "stash list";

        sa = "submodule add";

        lt = "describe --tags --abbrev=0";

        l = "log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --all";
        lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --all";
        pl = "log --pretty=format:'%C(yellow)%h %Cblue%>(12)%cr %Cgreen%<(7)%aN%Cred%d %Creset%s'";
        plg = "log --graph --pretty=format:'%C(yellow)%h %Cblue%>(12)%ad %Cgreen%<(7)%aN%Cred%d %Creset%s'";
        d = "diff";
        who = "shortlog -s --";
        cm = "checkout master";
      };
    };
  };
}
