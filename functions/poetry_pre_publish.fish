function poetry_pre_publish --description "https://github.com/atu4403/til/blob/47f26639f1bfc7cb62a444a742f4d8bbff57b3de/lang-python/pypi_update.md"
    if ! git_is_clean
        echo -e "gitがcleanな状態ではありません\ncommitするかstashしてやり直してください"
        return 1
    end
    set current_branch (git branch --show-current)
    set release_branch release_poetry
    if test current_branch = release_poetry
        echo "現在release_poetryブランチです。別のブランチを切って、release_poetryブランチを削除してやり直してください"
        echo -e "\tsample: git switch -c dev && git branch -d $release_branch"
        return 1
    end
    # checkout
    git switch -c $release_branch
    and git pull --rebase origin main
    # test
    if ! poetry shell && pytest
        return 1
    end
    set current_ver (poetry version -s)
    echo "現在のバージョンは$current_verです\nどのバージョンにしますか?(major/minor/patch)"
    read version_type
    switch $version_type
        case 'ma*'
            set version_type major
        case 'mi*'
            set version_type minor
        case '*'
            set version_type patch
    end
    and poetry version $version_type
    and set new_version (poetry version --short)
    and log_title build
    and poetry build
    # tag
    and log_title "tag v$new_version"
    and git tag v$new_version
    # create CHANGELOG
    and log_title "create CHANGELOG"
    and git-chglog --config ~/.config/.chglog/config.yml --output CHANGELOG.md
    and git tag --delete v$new_version
    and micro CHANGELOG.md
    # add and commit
    and log_title 'git add'
    and git add --all
    and log_title 'git commit'
    and git commit -m "update version $new_version"
    and log_title 'git push'
    and git push origin $release_branch
    and log_title 'pr create'
    and gh pr create --fill
    and gh pr view --web
end
