function cod
    cat '/Users/atu/Library/Application Support/Code/storage.json' |
        jq -r '.openedPathsList.entries[] | select(.folderUri)|.folderUri'
    # jq -r 'openedPathsList.entries[].folderUri'
end
