function git_is_clean
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        if ! git status --short | string length >/dev/null 2>&1
            return 0
        end
    end
    return 1
end
