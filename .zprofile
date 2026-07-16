# ようこそメッセージのクリア
# clear

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

if [ -f ~/.zprofile.local ]; then
  source ~/.zprofile.local
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$XDG_CONFIG_HOME/bin" ] ; then
  PATH="$XDG_CONFIG_HOME/bin:$PATH"
fi
if [ -d "$HOME/.cargo/bin" ] ; then
  PATH="$HOME/.cargo/bin:$PATH"
fi
if [ -d "$HOME/.deno/bin" ] ; then
  PATH="$HOME/.deno/bin:$PATH"
fi
# luarocks
if [ -d "$HOME/.luarocks/bin" ] ; then
  PATH="$HOME/.luarocks/bin:$PATH"
fi
# rbenv
if [ -d "$HOME/.rbenv/bin" ] ; then
  eval "$($HOME/.rbenv/bin/rbenv init - --no-rehash zsh)"
fi
# go
if [ -d "/usr/local/go/bin" ] ; then
  PATH="/usr/local/go/bin:$PATH"
fi
if [ -d "$HOME/go/bin" ] ; then
  PATH="$HOME/go/bin:$PATH"
fi
export GOPATH=$HOME/go
export GOTELEMETRYDIR="$HOME/.local/state/go/telemetry"

export XDG_DATA_HOME=$HOME/.local/share
export DOT_FILES=$XDG_CONFIG_HOME
export PRIVATE_DOTFILES_DIR=$HOME/git/dotfiles-private
export MYVIMRC=$DOT_FILES/vimrc.vim
export TERM=xterm-256color
export RI="-f markdown"
export RI_PAGER="nvim -RM -c 'set ft=markdown cocu=nc cole=2' -c 'nn q :q<cr>' -"
export EDITOR="nvim"
export GH_CONFIG_DIR=$HOME/.config/gh

# デフォルトパスを定義してあればshellを開いたときにそこをhomeディレクトリとして遷移させる
if ! [ -z "$DEFAULT_CD_PATH" ]; then
  if [ -d $DEFAULT_CD_PATH ]; then
    cd $DEFAULT_CD_PATH
  fi
fi
# vim
export FILER_DEFAULT=$HOME/workspace
# ruby
RUBYOPT='-W:deprecated'
