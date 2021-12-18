switch (uname)
    case Darwin
        if test -e /usr/local/bin/code
            set -x EDITOR /usr/local/bin/code --wait
        end
end
