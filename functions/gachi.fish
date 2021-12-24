function gachi -d "splatoonのスケジュールを出力"
    set -l url "https://spla2.yuu26.com/gachi/schedule"
    set -l foo (curl -Ls --insecure $url | jq -rc '.result[] | [.rule, .start_t, .maps[0], .maps[1]] | @tsv')
    for l in $foo
        set -l arr (string split \t $l)
        set arr[2] (date -r $arr[2] +"%H:%M ~")
        echo -e "$arr[2] $arr[1]\n\t$arr[3]\n\t$arr[4]\n"
    end | less -e
end
