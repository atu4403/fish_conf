function githash --wraps=git\ log\ --oneline\ \|\ peco\ \|\ cut\ -d\'\ \'\ -f1\|\ pbcopy --description alias\ githash\ git\ log\ --oneline\ \|\ peco\ \|\ cut\ -d\'\ \'\ -f1\|\ pbcopy
  git log --oneline | peco | cut -d' ' -f1| pbcopy $argv; 
end
