# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Change directories without cd
setopt autocd

# Load plugins from:
# antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

# Customize to your needs...
export PATH=~/phantomjs-1.7.0-macosx/bin:./bin:/usr/X11/bin:/Library/PostgreSQL/8.4/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/bin:/usr/bin:/sbin:/usr/sbin:~/bin:~/ruby/bin:/opt/local/bin:/opt/local/sbin:/usr/local/go/bin:$GOPATH/bin:/Applications/Julia-0.2.0.app/Contents/Resources/julia/bin:~/moai-sdk/bin

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
alias merge="git merge --no-ff"
alias remote="git remote"
alias prune="git remote prune origin" # remote branches were already deleted, so need to prune locals
alias gd="git diff"
alias gdc="git diff --cached"
alias oneline="git log --pretty=oneline"
alias ptags='git push --tags'
alias tags='git tag -n'
alias gb="git branch"
alias stash="git stash"
alias gtag="git tag -a `date -u \"+UTC_%Y%m%d%H%M%S\"`"
alias gap="git add -p"
alias fetch="git fetch"
alias a="ack"
alias v="/usr/local/Cellar/vim/8.2.0654/bin/vim"
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
alias vp="cd ~/.vim/pack/bundle/start"

# Environment
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LD_LIBRARY_PATH="/usr/local/lib"
export GOPATH="/Users/chip/code/go"
export EDITOR="/usr/local/bin/vim"
export GIT_EDITOR=${EDITOR}
export ARCHFLAGS="-arch x86_64"
export EVENTNOKQUEUE=1
export EVENT_NOKQUEUE=yes
export CLICOLOR=1
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

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

# Use n for managing node versions: https://github.com/tj/n

# npm
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"

export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# For use with zsh plugin lukechilds/zsh-nvm
export NVM_DIR="$HOME/.nvm"
export NVM_COMPLETION=true
export NVM_AUTO_USE=true

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
