function gachinow -d "solatoon現在のガチマステージを出力"
    set -l url "https://spla2.yuu26.com/gachi/now"
    set -l foo (curl -Ls --insecure $url | jq -rc '.result[] | [.rule, .start_t, .maps[0], .maps[1], .maps_ex[0].image, .maps_ex[1].image] | @tsv')
    set -l a (string split \t $foo)
    set a[2] (date -r $a[2] +"%H:%M ~")
    curl -Ls "$a[5]" | imgcat
    echo $a[3]
    curl -Ls "$a[6]" | imgcat
    echo $a[4]
    echo -e "$a[2] $a[1]"
end
