if status is-interactive
    set fish_greeting # supresses fish's intro message
    set EDITOR code-insiders
    set VISUAL code-insiders

    # filesystem aliases
    alias rm="rm -rf"
    alias mvf="mv -f"
    alias movef="mv -f"
    alias move="mv"
    alias cp="cp -ri"
    alias mkdir="mkdir -p"
    alias free="free -h"

    # emacs
    alias em="emacsclient -c -a 'emacs'"
    alias emacsnw="/usr/bin/emacs -nw"

    # dotfiles
    alias df="chezmoi -S $HOME/dots"
    abbr --add dfcd "df cd"
    abbr --add dfat "df add --template"
    abbr --add dfg "df git"
    abbr --add dfa "df apply"

    alias j="just"
    # exa
    # alias ls="exa -a"
    # alias la="exa -l --no-time --no-icons"
    # alias lg="exa --git -la --git-ignore --no-time"
    alias l="exa -al --no-time --no-icons --group-directories-first"
    alias ls="exa -al --no-time --no-icons --group-directories-first"
    alias la="exa -a"
    alias ll="exa -l --no-time --no-icons --group-directories-first"
    alias lt='exa -aT --no-time --no-icons --group-directories-first'
    alias l.="exa --group-directories-first --list-dirs (exa -a | grep '^\.')"

    # get fastest mirrors
    alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
    alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
    alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
    alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

    alias cat="bat"
    alias top="btm"
    alias du="dust"
    # alias tmux="zellij"
    # alias screen="zellij"
    # mprocs, irust, bacon, and cargo-info don't need aliases.
    # ripgrep and fd also do not.
    # ncspot currently don't need them either. 
    alias por="porsmo"
    alias gv="lazygit"
    alias download="axel"
    alias loc="tokei"
    alias dwn="axel"
    # alias i="ame install --sudoloop --noconfirm"
    # alias r="ame remove --sudoloop --noconfirm"
    # alias pkgsearch="ame search"
    # alias upgrade="ame upgrade --sudoloop --noconfirm"
    alias c="clear"

    # abbr --add pk "paru"
    # abbr --add pks "paru -S --sudoloop --noconfirm"
    # abbr --add pkr "paru -R --sudoloop --noconfirm"
    # abbr --add pkss "paru -Ss"
    abbr --add y "yay"
    abbr --add i "yay -Sy --sudoloop --noconfirm"
    # abbr --add r "yay -Rssd --sudoloop --noconfirm"
    abbr --add r "yay -Rss --sudoloop --noconfirm"
    abbr --add ko "yay -Qtdq | yay -Rns -"
    abbr --add yss "yay -Ss"
    abbr --add upgrade "yay -Syu --sudoloop --noconfirm"
    abbr --add pc "sudo pacman"
    abbr --add pcs "sudo pacman -Sy --sudoloop --noconfirm"
    abbr --add pcr "sudo pacman -Rssd --sudoloop --noconfirm"
    abbr --add pcss "sudo pacman -Ss"

    abbr --add glg "git lg"

    abbr --add dc docker-compose
    abbr --add dcu "docker-compose up"
    abbr --add dcd "docker-compose down"
    # abbr --add em "doas emerge"
    # abbr --add emav "doas emerge -av"
    # abbr --add empv "doas emerge -pv"
    # abbr --add emum "doas emerge --autounmask-write --autounmask --ask"
    # abbr --add dpc "doas dispatch-conf"
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
    # abbr --add updateworld "doas emerge -auDN --with-bdeps=y @world"
    # abbr --add updategentoo "doas emerge -ND @world"

    alias fzf="fzf --border=rounded --prompt='\$ ' --pointer='~' --marker=' >' --bind 'ctrl-s:toggle'"

    set -x ABBR_TIPS_PROMPT "{{ .abbr }} => {{ .cmd }}"

    zoxide init fish | source
    starship init fish | source
    fish_vi_key_bindings

    # set -x MANPAGER "sh -c 'col -bx | bat -l man -p --color always --paging always'"
    set -x GPG_TTY $(tty)
    set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gcr/ssh"
    # enable_transience
end

string match -q "$TERM_PROGRAM" vscode
and . (code-insiders --locate-shell-integration-path fish)
