function ccd
    fd --type d | fzf | read foo
    and cde $foo
end
