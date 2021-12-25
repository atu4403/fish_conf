function pips -d "pypiに名前が登録されているか確認"
    curl -s https://pypi.org/pypi/$argv[1]/json | sed '2,$d' | sed 's/^[^{].*/{"info":{"package_url":"404 not found"}}/' | jq --raw-output .info.package_url
end
