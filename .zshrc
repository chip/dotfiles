# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pure"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=~/phantomjs-1.7.0-macosx/bin:./bin:/usr/X11/bin:/Library/PostgreSQL/8.4/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/bin:/usr/bin:/sbin:/usr/sbin:~/bin:~/ruby/bin:/opt/local/bin:/opt/local/sbin:/usr/local/go/bin:$GOPATH/bin:/Applications/Julia-0.2.0.app/Contents/Resources/julia/bin:~/moai-sdk/bin

# Mail
alias mi="tail -f /var/log/mail.log"

# dmg to iso conversion
alias dmg2iso="hdiutil convert filename.dmg -format UDTO -o savefile.iso"

# Processes
alias tu="top -o cpu"
alias tm="top -o vsize"

# List files
alias ll="ls -al"
alias l="ls -al"

# Dito with hosts
alias hosts='sudo vi /etc/hosts'

# Git
alias g="git"
alias ga="git add ."
alias s="git status"
alias gs="git status"
alias gst="echo 'Use s or gs instead' && git status"
alias pull="git pull origin"
alias pullm='git pull --rebase origin master'
alias push="git push origin"
alias c="git commit -m "
alias ca="git commit -a -m "
alias commita="echo 'Use ca instead' && git commit -a -m "
alias commit="echo 'Use c instead' && git commit -m"
alias undo="git reset --soft HEAD^"
alias status="git status"
alias co="git checkout"
alias coma="git checkout master"
alias branch="git branch"
alias merge="git merge --no-ff"
alias remote="git remote"
alias prune="git remote prune origin" # remote branches were already deleted, so need to prune locals
alias gd="git diff"
alias gitd="echo 'Use gd instead' && git diff"
alias gitdc="git diff --cached"
alias gdc="git diff --cached"
alias oneline="git log --pretty=oneline"
alias ptags='git push --tags'
alias tags='git tag -n'
alias gb="git branch"
alias stash="git stash"
alias gtag="git tag -a `date -u \"+UTC_%Y%m%d%H%M%S\"`"
alias gap="git add -p"
alias fetch="git fetch"
alias a="ag"
alias v="vim"

# Postfix Load on Startup
alias postgres_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias postgres_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# JDK home
alias jdkhome="cd /System/Library/Frameworks/JavaVM.framework/Home"

alias code="cd ~/code"

alias stuck="ps ax | sed '1p;/ [U] /!d'"

alias mysqlgem='env ARCHFLAGS="-arch x86_64" gem install mysql2 --config-file bundler_config.yml'

alias chrome="open /Applications/Google\ Chrome.app/"
alias firefox="open /Applications/Firefox.app/"
alias safari="open /Applications/Safari.app/"

alias spn="rake spec:no_rails"

alias ctags="`brew --prefix`/bin/ctags"

alias tree="tree -C"

alias be='bundle exec'

alias game="export PWD=`pwd` && zip -r ${PWD}.love *"

# Environment
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LD_LIBRARY_PATH="/usr/local/lib"
export GOPATH="/Users/chip/code/go"
export EDITOR="/usr/bin/vim"
export SVN_EDITOR=${EDITOR}
export GIT_EDITOR=${EDITOR}
export ARCHFLAGS="-arch x86_64"
export EVENTNOKQUEUE=1
export EVENT_NOKQUEUE=yes
export CLICOLOR=1
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

function encode() { echo -n $@ | perl -pe's/([^-_.~A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg'; }
function commands() {
  awk '{a[$2]++}END{for(i in a){print a[i] " " i}}'
}

function vgit() { vim `git status -s | cut -d ' ' -f 3` }

function checkout-pr () {
  git fetch origin pull/$1/head:pr-$1 && git checkout pr-$1;
}

alias topten="history | commands | sort -rn | head"
alias cores="sysctl -n hw.ncpu"

alias typescript-convert="cat typescript | perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g' | col -b > typescript-processed"

# vim bindings for the command line
bindkey -v
bindkey '^R' history-incremental-search-backward

fpath=($HOME/.zsh/func $fpath)
typeset -U fpath

export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PERL_LOCAL_LIB_ROOT="/Users/chip/perl5:$PERL_LOCAL_LIB_ROOT";
export PERL_MB_OPT="--install_base "/Users/chip/perl5"";
export PERL_MM_OPT="INSTALL_BASE=/Users/chip/perl5";
export PERL5LIB="/Users/chip/perl5/lib/perl5:$PERL5LIB";
export PATH="/Users/chip/perl5/bin:$PATH";

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=${JAVA_HOME}/bin:$PATH

## #Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Android for Meteor
export ANDROID_HOME=~/Library/Android/sdk
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/tools"

# Use n for managing node versions: https://github.com/tj/n

# npm
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
