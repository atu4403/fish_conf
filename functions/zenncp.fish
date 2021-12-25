function zenncp -d "tilのmdファイルを選択してzenn-hubにcopyする"
    fd '\.md$' /Users/atu/ghq/github.com/atu4403/til/ | fzf | read md
    set -l a_path /Users/atu/ghq/github.com/atu4403/zenn-hub/articles
    set -l filename $a_path/(basename $md)
    if test -e $filename
        echo 'exists file '$filename
    else
        begin
            cat /Users/atu/ghq/github.com/atu4403/zenn-hub/header.yml
            cat $md
        end >$filename
        echo "create: $filename"
    end
end
