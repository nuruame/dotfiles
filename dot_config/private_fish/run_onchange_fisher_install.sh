#!/bin/fish

if not test -e "$HOME/.config/fish/functions/fisher.fish"
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
end

fisher install jhillyerd/plugin-git
fisher install jethrokuan/fzf
fisher install laughedelic/pisces
fisher install jorgebucaran/fish-bax
fisher install danhper/fish-ssh-agent
fisher install oh-my-fish/plugin-license
fisher install halostatue/fish-docker@v1.x
fisher install oh-my-fish/plugin-gi
fisher install jorgebucaran/autopair.fish
fisher install oh-my-fish/plugin-bang-bang
