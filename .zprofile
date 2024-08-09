# ようこそメッセージのクリア
clear

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

if [ -f ~/.zprofile.local ]; then
  source ~/.zprofile.local
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

export XDG_DATA_HOME=$HOME/.local/share
export DOT_FILES=$XDG_CONFIG_HOME
export MYVIMRC=$DOT_FILES/vimrc.vim
export TERM=xterm-256color
export RI="-f markdown"
export RI_PAGER="nvim -RM -c 'set ft=markdown cocu=nc cole=2' -c 'nn q :q<cr>' -"
export EDITOR="nvim"

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
