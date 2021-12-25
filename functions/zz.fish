function zz -d "zのlistから選択して移動"
    z --list | fzf | read foo
    and set foo (string split ' ' $foo)
    and cde $foo[-1]
end
