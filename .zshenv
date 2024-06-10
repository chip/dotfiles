# Environment
export ARCHFLAGS="-arch arm64"
export CLICOLOR=1
export DOCKER_DEFAULT_PLATFORM=linux/amd64
export EDITOR="/usr/local/bin/nvim"
export EVENTNOKQUEUE=1
export EVENT_NOKQUEUE=yes
export GEM_HOME="~/.gem"
export GEM_PATH="~/.gem"
export GIT_EDITOR=${EDITOR}
export GOPATH=$HOME/code/go
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1_000_000_000
export HISTSIZE=1_000_000_000
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LD_LIBRARY_PATH="/usr/local/lib"
export LUA_CPATH="/usr/local/lib/lua/5.1/?.so;./?.so;/Users/chip/.luarocks/lib/lua/5.1/?.so;"
export LUA_PATH="/usr/local/Cellar/luarocks/3.8.0/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;/usr/local/lib/lua/5.1/?.lua;/usr/local/lib/lua/5.1/?/init.lua;./?.lua;./?/init.lua;/Users/chip/.luarocks/share/lua/5.1/?.lua;/Users/chip/.luarocks/share/lua/5.1/?/init.lua;"
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export NPM_PACKAGES="${HOME}/.npm-packages"
export PERL5LIB="/Users/chip/perl5/lib/perl5:$PERL5LIB";
export PERL_LOCAL_LIB_ROOT="/Users/chip/perl5:$PERL_LOCAL_LIB_ROOT";
export PERL_MB_OPT="--install_base "/Users/chip/perl5"";
export PERL_MM_OPT="INSTALL_BASE=/Users/chip/perl5";
export PYENV="/Users/chip/.pyenv"
export RUBY_CONFIGURE_OPTS=--with-libyaml-dir=$(/opt/homebrew/bin/brew --prefix libyaml)
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

setopt HIST_FIND_NO_DUPS
# following should be turned off, if sharing history via setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
