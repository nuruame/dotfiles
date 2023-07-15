function l -d "run lg if in a git repo, else run ls"
    set -l ingit $(git rev-parse --is-inside-work-tree 2>/dev/null)
    if test "$ingit" != ""
        lg
    else
        ls
    end
end
