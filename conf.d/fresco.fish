set -l bootstrap_file /Users/atu/ghq/github.com/masa0x80/fresco/fresco.fish
if test -r $bootstrap_file
    source $bootstrap_file
else
    mkdir -p /Users/atu/ghq/github.com/masa0x80/fresco
    git clone https://github.com/masa0x80/fresco /Users/atu/ghq/github.com/masa0x80/fresco
end
