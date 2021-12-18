function see
    ghq list --full-path | fzf | read foo
    set -l ghq_path (string split '/' $foo)
    gh repo view --web "$ghq_path[-2]/$ghq_path[-1]"
end
