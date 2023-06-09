source pathos.sh
# Prompt
fpath+=/opt/homebrew/share/zsh/site-functions
autoload -U promptinit; promptinit
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
alias v=~/bin/chip-nvim.sh
alias miniv=~/bin/mini-nvim.sh
alias bv=~/bin/vim-bootstrap.sh
alias jdkhome="cd /System/Library/Frameworks/JavaVM.framework/Home"
alias stuck="ps ax | sed '1p;/ [U] /!d'"
alias tree="tree -C"
alias topten="history | commands | sort -rn | head"
alias vp="cd ~/.local/share/nvim/site/pack/paqs/start"
alias vc="cd ~/.config/nvim"
alias vcl="cd ~/.config/nvim/lua"
alias lr="luarocks --lua-dir=/usr/local/opt/lua@5.1 --lua-version=5.1 --local "
alias ppath="echo \$PATH | sed 's/:/\n/g'"
alias nlua="/usr/local/bin/rlwrap /usr/local/bin/luajit"
alias mongo-start="mongod --dbpath /usr/local/var/mongodb --logpath /usr/local/var/log/mongodb/mongo.log --fork"
alias mongo-log="cd /usr/local/var/log/mongodb"
alias luamake=/Users/chip/code/lua-language-server/3rd/luamake/luamake
alias quitfinder="defaults write com.apple.finder QuitMenuItem -bool true && killall Finder"
alias kitty-themes="kitty +kitten themes"
alias open-ports="sudo lsof -i -n -P | grep TCP"

# Prevent mongodb error
ulimit -n 65536

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# CUSTOM load nvm only when needed
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
