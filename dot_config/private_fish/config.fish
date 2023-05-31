if status is-interactive
    set fish_greeting # supresses fish's intro message
    set EDITOR code-insiders
    set VISUAL code-insiders

    # filesystem aliases
    alias rm="rm -rf"
    alias mvf="mv -f"
    alias movef="mv -f"
    alias move="mv"
    alias cp="cp -r"
    alias mkdir="mkdir -p"
    alias fd="cd"
    alias fd.="cd .."
    alias fd..="cd ../.."
    alias f="z"
    alias kf="touch"
    alias kd="take"

    # dotfiles
    alias df="chezmoi -S $HOME/.dotfiles"
    abbr --add dfcd "df cd"
    abbr --add dfat "df add --template"
    abbr --add dfg "df git"
    abbr --add dfa "df apply"

    alias j="just"
    alias ls="exa -a"
    alias la="exa -l --no-time --no-icons"
    alias lg="exa --git -l --git-ignore --no-time"
    alias cat="bat"
    alias top="btm"
    alias du="dust"
    alias tmux="zellij"
    alias screen="zellij"
    # mprocs, irust, bacon, and cargo-info don't need aliases.
    # ncspot and porsmo currently don't need them either. 
    alias por="porsmo"
    alias gv="lazygit"
    alias download="axel"
    alias loc="tokei"
    alias dwn="axel"
    alias i="ame install --sudoloop --noconfirm"
    alias r="ame remove --sudoloop --noconfirm"
    alias pkgsearch="ame search"
    alias upgrade="ame upgrade --sudoloop --noconfirm"
    alias c="clear"

    abbr --add dc docker-compose
    abbr --add e. "code-insiders -r ."
    abbr --add dk docker
    abbr --add fi "fisher install"
    abbr --add fl "fisher list"
    abbr --add cs "source ~/.config/fish/config.fish"
    abbr --add serve "python3 -m http.server"
    abbr --add gcr "gh cr"
    abbr --add ghr "gh repo"
    abbr --add pomo "porsmo pomodoro custom 15:00 10:00 20:00"
    abbr --add gnomeversion "gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.freedesktop.DBus.Properties.Get 'org.gnome.Shell' 'ShellVersion'"

    alias fzf="fzf --border=rounded --prompt='\$ ' --pointer='~' --marker=' >' --bind 'ctrl-s:toggle'"

    set -x ABBR_TIPS_PROMPT "{{ .abbr }} => {{ .cmd }}"

    zoxide init fish | source
    starship init fish | source

    set -x MANPAGER "sh -c 'col -bx | bat -l man -p --paging=always'"
    set -x GPG_TTY $(tty)
    # enable_transience
end

string match -q "$TERM_PROGRAM" vscode
and . (code --locate-shell-integration-path fish)
