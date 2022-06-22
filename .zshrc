function cd {
  builtin cd "$@" && exa --long --git --icons -aa
}

PREVIOUS=`gdate +%s%3N`

debugger () {
  CURRENT=`gdate +%s%3N`
  DIFF="$(($CURRENT-$PREVIOUS))"
  PREVIOUS=$CURRENT
  echo $1 "difference: " $DIFF
}

# WARNING - THIS IS SLOW - CALL THIS MANUALLY IF YOU NEED IT
setup-compinit() {
  if type brew &>/dev/null; then
    # FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
    FPATH=/usr/local/share/zsh/site-functions:$FPATH

    autoload -Uz compinit
    if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
      compinit
      touch .zcompdump
    else
      compinit -C
    fi
  fi
}
autoload -U promptinit; promptinit
prompt pure

# Change directories without cd
setopt autocd autopushd

# Environment
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LD_LIBRARY_PATH="/usr/local/lib"
export GOPATH=$HOME/code/go/bin
export EDITOR="/usr/local/bin/nvim"
export GIT_EDITOR=${EDITOR}
export ARCHFLAGS="-arch x86_64"
export EVENTNOKQUEUE=1
export EVENT_NOKQUEUE=yes
export CLICOLOR=1
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export GEM_HOME="~/.gem"
export GEM_PATH="~/.gem"

# vim bindings for the command line
bindkey -v
bindkey '^R' history-incremental-search-backward

export PERL_LOCAL_LIB_ROOT="/Users/chip/perl5:$PERL_LOCAL_LIB_ROOT";
export PERL_MB_OPT="--install_base "/Users/chip/perl5"";
export PERL_MM_OPT="INSTALL_BASE=/Users/chip/perl5";
export PERL5LIB="/Users/chip/perl5/lib/perl5:$PERL5LIB";

export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:./bin:/usr/X11/bin:/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/bin:/usr/bin:/sbin:/usr/sbin:~/bin:/usr/local/opt/ruby/bin:~/.gem/ruby/2.6.0/cache:/opt/local/bin:/opt/local/sbin:$GOPATH
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
export PATH="/Users/chip/perl5/bin:$PATH"

## #Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

export PYENV="/Users/chip/.pyenv"

# npm
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"

export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Aliases
alias ll="ls -al"
alias l="ls -al"
# Git
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
# yadm aliases
alias y="yadm"
alias ya="yadm add ."
alias ys="yadm status"
alias ypull="yadm pull origin"
alias ypullm='yadm pull --rebase origin master'
alias ypush="yadm push origin"
alias yc="yadm commit -m "
alias yca="yadm commit -a -m "
alias yundo="yadm reset --soft HEAD^"
alias yd="yadm diff"
alias ydc="yadm diff --cached"
alias yol="yadm log --pretty=oneline"
alias yr="yadm restore --staged"
alias yap="yadm add -p"
# Searching
alias a="ack"
alias v=$EDITOR
# JDK home
alias jdkhome="cd /System/Library/Frameworks/JavaVM.framework/Home"
alias stuck="ps ax | sed '1p;/ [U] /!d'"
alias tree="tree -C"
alias topten="history | commands | sort -rn | head"
# Vim plugins directory
alias vp="cd ~/.local/share/nvim/site/pack/paqs/start"
alias vc="cd ~/.config/nvim"
alias vcl="cd ~/.config/nvim/lua"
alias lr="luarocks --lua-dir=/usr/local/opt/lua@5.1 --lua-version=5.1 --local "
alias ppath="echo \$PATH | sed 's/:/\n/g'"
alias nlua="/usr/local/bin/rlwrap /usr/local/bin/luajit"
# Mongo
alias mongo_start="brew services start mongodb/brew/mongodb-community"
alias mongo_stop="brew services stop mongodb/brew/mongodb-community"
alias mongo_log="cd /usr/local/var/log/mongodb"
alias mongo_config="nvim /usr/local/etc/mongod.conf"
alias mongo_plist="nvim ~/Library/LaunchAgents/homebrew.mxcl.mongodb-community.plist"
# WARNING - THIS IS SLOW - CALL THIS MANUALLY IF YOU NEED IT
# heroku autocomplete setup
heroku-setup() {
  HEROKU_AC_ZSH_SETUP_PATH=/Users/chip/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
}
# Prevent mongodb error
ulimit -n 65536
ulimit -u 2048

LUA_CPATH="/usr/local/lib/lua/5.1/?.so;./?.so;/Users/chip/.luarocks/lib/lua/5.1/?.so;"
LUA_PATH="/usr/local/Cellar/luarocks/3.8.0/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;/usr/local/lib/lua/5.1/?.lua;/usr/local/lib/lua/5.1/?/init.lua;./?.lua;./?/init.lua;/Users/chip/.luarocks/share/lua/5.1/?.lua;/Users/chip/.luarocks/share/lua/5.1/?/init.lua;"
export PATH="/Users/chip/.luarocks/bin:/Users/chip/perl5/bin:/Users/chip/.npm-packages/bin:/usr/local/opt/python@3.8/bin:/usr/local/opt/openssl@1.1/bin:/usr/local/opt/qt@5.5/bin:/usr/local/opt/openssl/bin:/usr/local/heroku/bin:/Users/chip/.rbenv/shims:/Users/chip/.rbenv/bin:/usr/local/opt//Applications/Postgres.app/Contents/Versions/latest/bin:./bin:/usr/X11/bin:/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/bin:/usr/bin:/sbin:/usr/sbin:/Users/chip/bin:/usr/local/opt/ruby/bin:/Users/chip/.gem/ruby/2.6.0/cache:/opt/local/bin:/opt/local/sbin:/Users/chip/code/go/bin:/Users/chip/Library/Android/sdk/platform-tools:/Users/chip/Library/Android/sdk/tools:/usr/local/opt/fzf/bin:/Users/chip/n/bin:$PATH"

function load_nvm {
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
}
function load_luaver {
  [ -s ~/.luaver/luaver ] && . ~/.luaver/luaver
}
# Fix luaver install-luajit 2.1.0-beta3
export MACOSX_DEPLOYMENT_TARGET=11.6.1
export PATH="/Users/chip/.cargo/bin:$PATH"

alias luamake=/Users/chip/code/lua-language-server/3rd/luamake/luamake
