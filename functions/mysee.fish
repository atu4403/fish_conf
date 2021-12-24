function mysee
    gh repo list | fzf | cut -f 1 | read foo
    gh repo view --web $foo
end
