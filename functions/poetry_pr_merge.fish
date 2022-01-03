function poetry_pr_merge --description "https://github.com/atu4403/til/blob/47f26639f1bfc7cb62a444a742f4d8bbff57b3de/lang-python/pypi_update.md"
    set release_branch release_poetry
    set -l pkg_ver (poetry version --short)
    gh pr view release_poetry
    and echo -e "PRのmerge、CHANGELOG.mdを使ったGitHubへのrelease、pypiへのpublishを行います。\n\tdirectory: $PWD\n\tversion: $pkg_ver\n間違いないですか？(Y/n)"
    and read confirm
    if test $confirm != Y
        echo bye
        return 0
    end
    and log_title 'pullrequest merge'
    and gh pr merge $release_branch -dm --body "update v$pkg_ver"
    and log_title 'switch new branch'
    and git switch --no-track -c "v$pkg_ver"_after remotes/origin/main
    and git fetch --prune
    and log_title "create release"
    and set -l release_file dist/(basename $PWD)-$pkg_ver.tar.gz
    and gh release create "v$pkg_ver" -F CHANGELOG.md --title "v$pkg_ver" $release_file
    and log_title publish
    and poetry publish
end
