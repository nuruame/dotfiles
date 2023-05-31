function giv
    gi list | sed "s/,/\n/g" | fzf -m --print0 | xargs --null echo | sed "s/ /,/g" | xargs -I {} fish -c "gi {}"
end
