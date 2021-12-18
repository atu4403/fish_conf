function zz
    z --list | fzf | read foo
    and set foo (string split ' ' $foo)
    and cde $foo[-1]
end
