if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -x PATH /Users/atu/.local/bin $PATH
set -x PATH /Users/atu/go/bin $PATH
set -x PATH /Applications/Wireshark.app/Contents/MacOS $PATH
set -x PATH /opt/X11/bin $PATH
set -x PATH /Library/TeX/texbin $PATH
set -x PATH /sbin $PATH
set -x PATH /usr/sbin $PATH
set -x PATH /bin $PATH
set -x PATH /usr/bin $PATH
set -x PATH /usr/local/bin $PATH
set -x PATH /Users/atu/.rbenv/shims $PATH
set -x PATH /Users/atu/bin $PATH
set -x PATH /Users/atu/.pyenv/shims $PATH
set -x PATH /Users/atu/.goenv/bin $PATH
set -x PATH /Users/atu/.goenv/shims $PATH
set -x PATH /Users/atu/.volta/bin $PATH

set -x DOCKER_TLS_VERIFY 1
set -x DOCKER_HOST "tcp://192.168.99.100:2376"
set -x DOCKER_CERT_PATH "/Users/atu/.docker/machine/machines/default"
set -x DOCKER_MACHINE_NAME default
set -x PYENV_ROOT "$HOME/.pyenv"
set -x VOLTA_HOME "$HOME/.volta"

rbenv init - | source
pyenv init - | source
goenv init - | source

# starship init fish | source

# iterm2
source ~/.iterm2_shell_integration.fish

# hydro
# set -g hydro_symbol_prompt '🎲  '
# set -g hydro_symbol_prompt '💰 '
set -g hydro_symbol_prompt '>'
# set -g hydro_symbol_prompt '»»»'
set -g hydro_symbol_git_dirty 👻
set -g hydro_color_pwd $fish_color_comment
set -g hydro_color_git $fish_color_command
set -g hydro_color_error red
set -g hydro_color_prompt green
set -g hydro_color_duration yellow
