# zmodload zsh/zprof

function cd {
  builtin cd "$@" && exa --long --git --icons -aa
}

now () {
  echo `gdate +%s%3N`
}
# PREVIOUS="$(now)"

debugger () {
  CURRENT="$(now)"
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

export PATH=/usr/local/opt/mongodb-community@4.0/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:./bin:/usr/X11/bin:/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/bin:/usr/bin:/sbin:/usr/sbin:~/bin:/usr/local/opt/ruby/bin:~/.gem/ruby/2.6.0/cache:/opt/local/bin:/opt/local/sbin:$GOPATH

# vim bindings for the command line
bindkey -v
bindkey '^R' history-incremental-search-backward

export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
export PERL_LOCAL_LIB_ROOT="/Users/chip/perl5:$PERL_LOCAL_LIB_ROOT";
export PERL_MB_OPT="--install_base "/Users/chip/perl5"";
export PERL_MM_OPT="INSTALL_BASE=/Users/chip/perl5";
export PERL5LIB="/Users/chip/perl5/lib/perl5:$PERL5LIB";
export PATH="/Users/chip/perl5/bin:$PATH";

## #Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Android for Meteor
export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_ROOT=${ANDROID_HOME}
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/tools"

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

export PYENV="/Users/chip/.pyenv"

# npm
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"

export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# zprof
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

# Aliases

# Mail
alias mi="tail -f /var/log/mail.log"

# List files
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
alias gm="git merge --no-ff"
alias gr="git remote"
alias prune="git remote prune origin" # remote branches were already deleted, so need to prune locals
alias gd="git diff"
alias gdc="git diff --cached"
alias oneline="git log --pretty=oneline"
alias ol="git log --pretty=oneline"
alias ptags='git push --tags'
alias tags='git tag -n'
alias gb="git branch"
alias gr="git restore --staged"
alias stash="git stash"
alias gtag="git tag -a `date -u \"+UTC_%Y%m%d%H%M%S\"`"
alias gap="git add -p"
alias gaf="git add -f"
alias gapf="git add -fp"
alias gf="git fetch"
alias a="ack"
alias v=$EDITOR
# Postfix Load on Startup
alias postgres_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias postgres_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
# JDK home
alias jdkhome="cd /System/Library/Frameworks/JavaVM.framework/Home"
alias stuck="ps ax | sed '1p;/ [U] /!d'"
alias mysqlgem='env ARCHFLAGS="-arch x86_64" gem install mysql2 --config-file bundler_config.yml'
alias tree="tree -C"
alias be='bundle exec'
alias topten="history | commands | sort -rn | head"
alias cores="sysctl -n hw.ncpu"
# Vim plugins directory
alias vp="cd ~/.local/share/nvim/site/pack/paqs/start"
alias vc="cd ~/.config/nvim"
alias vcl="cd ~/.config/nvim/lua"
alias lr="luarocks --lua-dir=$(brew --prefix)/opt/lua@5.1 --lua-version=5.1 --local "
alias ppath="echo \$PATH | sed 's/:/\n/g'"

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
export PATH='/Users/chip/.luarocks/bin:/Users/chip/perl5/bin:/Users/chip/.npm-packages/bin:/usr/local/opt/python@3.8/bin:/usr/local/opt/openssl@1.1/bin:/usr/local/opt/qt@5.5/bin:/usr/local/opt/openssl/bin:/usr/local/heroku/bin:/Users/chip/.rbenv/shims:/Users/chip/.rbenv/bin:/usr/local/opt/mongodb-community@4.0/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:./bin:/usr/X11/bin:/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/bin:/usr/bin:/sbin:/usr/sbin:/Users/chip/bin:/usr/local/opt/ruby/bin:/Users/chip/.gem/ruby/2.6.0/cache:/opt/local/bin:/opt/local/sbin:/Users/chip/code/go/bin:/Users/chip/Library/Android/sdk/platform-tools:/Users/chip/Library/Android/sdk/tools:/usr/local/opt/fzf/bin:/Users/chip/n/bin'

function load_nvm {
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
}

eval "$(zoxide init zsh)"

