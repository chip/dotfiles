# Prompt
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=λ
prompt pure
# Change directories without cd
setopt autocd autopushd
# Corrections
setopt CORRECT
setopt CORRECT_ALL
# Vi mode
bindkey -v
# Search commands
bindkey '^R' history-incremental-search-backward
# Aliases
alias ll="ls -al"
alias l="ls -al"
alias g="git"
alias ga="git add ."
alias s="git status"
alias pull="git pull origin"
alias pullm='git pull --rebase origin master'
alias push="git push origin"
alias c="git commit -m "
alias ca="git commit -a -m "
alias undo="git reset --soft HEAD^"
alias co="git checkout"
alias coma="git checkout master"
alias prune="git remote prune origin" # remote branches were already deleted, so need to prune locals
alias gd="git diff"
alias gdc="git diff --cached"
alias ol="git log --pretty=oneline"
alias ptags='git push --tags'
alias tags='git tag -n'
alias gb="git branch"
alias gr="git restore --staged"
alias stash="git stash"
alias gtag="git tag -a `date -u \"+UTC_%Y%m%d%H%M%S\"`"
alias gap="git add -p"
alias gf="git fetch"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias a="ack"
alias v=nvim
alias chipv=~/bin/chip-nvim.sh
alias miniv=~/bin/mini-nvim.sh
alias bv=~/bin/vim-bootstrap.sh
alias jdkhome="cd /System/Library/Frameworks/JavaVM.framework/Home"
alias stuck="ps ax | sed '1p;/ [U] /!d'"
alias tree="tree -C"
alias topten="history | commands | sort -rn | head"
alias vp="cd ~/.local/share/nvim/lazy"
alias vc="cd ~/.config/nvim"
alias lr="luarocks --lua-dir=/usr/local/opt/lua@5.1 --lua-version=5.1 --local "
alias ppath="echo \$PATH | sed 's/:/\n/g'"
alias nlua="/usr/local/bin/rlwrap /usr/local/bin/luajit"
alias mongo-start="mongod --dbpath /usr/local/var/mongodb --logpath /usr/local/var/log/mongodb/mongo.log --fork"
alias mongo-log="cd /usr/local/var/log/mongodb"
alias luamake=/Users/chip/code/lua-language-server/3rd/luamake/luamake
alias quitfinder="defaults write com.apple.finder QuitMenuItem -bool true && killall Finder"
alias kitty-themes="kitty +kitten themes"
alias kt="kitty +kitten ssh kt" # ssh kt server with usable CLI
alias open-ports="sudo lsof -i -n -P | grep TCP"
alias docs="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/Documents"

# Prevent mongodb error
ulimit -n 65536

export NVM_DIR="$HOME/.nvm"
[ -s "$HOME/bin/nvm" ] && \. "$HOME/bin/nvm"  # This loads nvm bash_completion
alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"

function load_luaver {
  [ -s ~/.luaver/luaver ] && . ~/.luaver/luaver
}
# Autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# raco find package locations
function rfc() {
  cd `racket -l find-collection/run -- $@`
}

# interactive version
function rfci() {
  cd `racket -l find-collection/run -- -i $@`
}
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias rom='cd ~/rubyonmac && ./rom-prime 2>&1 | tee ~/rubyonmac/logs/rom-prime-normal.log'

alias romup='cd ~/Downloads/rubyonmac-prime && /bin/bash install'

source /opt/homebrew/opt/chruby/share/chruby/chruby.sh

source /opt/homebrew/opt/chruby/share/chruby/auto.sh

eval "$(nodenv init -)"

nodenv global 18.17.1

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nodenv global 18.19.0

chruby ruby-3.3.0

. /opt/homebrew/opt/asdf/libexec/asdf.sh
