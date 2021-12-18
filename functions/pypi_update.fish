function pypi_update
    if test (git rev-parse --is-inside-work-tree 2>/dev/null)
        set -l foo (git status --short)
        if test (string length $foo)
            echo git is not clean
            return 1
        end
        return 0
    end
    echo not git
    return 1
end
