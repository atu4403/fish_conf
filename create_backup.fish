set -l d (date "+%Y-%m")
set -l backup "backup/fish_variables_$d"
if ! test -e $backup
    cp fish_variables $backup
    echo create $backup
end
