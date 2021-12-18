function help-ja --description 'Show Japanese help for the fish shell'
  set -l topics (builtin -n) tutorial document-ja faq-ja design-document-ja
  set -l home 'http://fish.rubikitch.com'

  switch "$argv[1]"
    case -h --h --he --hel --help
      echo 'Usage: help-ja [TOPIC]'
    case $topics
      open "$home/$argv[1]"
    case '*'
      open $home
  end
end
