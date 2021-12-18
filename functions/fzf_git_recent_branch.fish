function fzf_git_recent_branch --description 'Efficient fish keybinding for fzf with git branch'
  # git branch --sort=-authordate | fzf | read -z select
  git branch --sort=-authordate | fzf --query (commandline) --reverse | read -z select

  if not test -z $select
    set select (builtin string trim --chars='* ' "$select")
    set select (builtin string trim --right "$select")
    git switch "$select"
  end

  commandline -f repaint
end
