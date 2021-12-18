function fzf_git_select_sha
    git log -n1000 --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" $argv |\
    fzf -m --ansi --no-sort --reverse --tiebreak=index --preview 'f() {
      set -- $(echo "$@" | grep -o "[a-f0-9]\{7\}" | head -1);
      if [ $1 ]; then
        git show --color $1
      else
        echo "blank"
      fi
    }; f {}' |\
    grep -o "[a-f0-9]\{7\}" |
    tr '\n' ' '| tr -d ' '
end
