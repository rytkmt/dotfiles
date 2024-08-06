source $HOME/.bashrc.local
clear
# コマンドの履歴を連続した同一コマンドは記録しない
HISTCONTROL=ignoredups
HISTSIZE=100000
HISTFILESIZE=100000

# 複数セッションがある場合に、履歴を上書きせず両方の履歴が追記される
shopt -s histappend

# ウィンドウサイズを変更した際にすぐ反映する
shopt -s checkwinsize

# 補完
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias ll='ls -la'
alias l1='ls -1'
alias l1r='find . -type f | sed "s|^\./||"'
alias lt='tree -I "node_modules|.git|.cache|vendor|tmp" -a '
alias ltl='lt | less -r'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# xargsをパイプで実行するときに引数にエイリアスを使えるようにする
alias xargs='xargs '
alias vi='/usr/bin/vim'
alias vim='nvim'
alias vimo='vim -O'
# alias vimd='echo "DiffviewOpen $@"'
function vimd() {
  eval "vim -c \"DiffviewOpen $@\""; \
}
alias sudo="sudo env PATH=$PATH"
if [[ $(command -v pipgre) ]]; then
  function als() {
    if [ $# == 0 ]; then
      alias | sort | sed s/^alias\.// | sed -e 's/=/ /' | awk '{printf "%-10s %s",$1,c="";for(i=2;i<=NF;i++) c=c $i" "; print c}' | sed s/\'// | sed s/\'//
    else
      alias | sort | sed s/^alias\.// | sed -e 's/=/ /' | awk '{printf "%-10s %s",$1,c="";for(i=2;i<=NF;i++) c=c $i" "; print c}' | sed s/\'// | sed s/\'// | pipgre $*
    fi
  }
else
  alias als="alias | sort | sed s/^alias\.// | sed -e 's/=/ /' | awk '{printf \"%-10s %s\",\$1,c=\"\";for(i=2;i<=NF;i++) c=c \$i\" \"; print c}' | sed s/\'// | sed s/\'//"
fi
alias ebr='vim $XDG_CONFIG_HOME/.bashrc'
alias ebp='vim $XDG_CONFIG_HOME/.bash_profile'
alias ebrl='vim $HOME/.bashrc.local'
alias ebpl='vim $HOME/.bash_profile.local'
alias egc='vim $XDG_CONFIG_HOME/.gitconfig'
alias cdv='cd $XDG_CONFIG_HOME'
alias cdh='cd $XDG_CONFIG_HOME/../lighthouse'
alias cdg='cd $HOME/git'
alias sbr='source $HOME/.bashrc'

function flon() {
  sed -e 's/:.*$//' | grep -v '^D' | sed -e 's/^\s\?[AMURD\?]\{1,2\}\s\+//' | sed -e 's/^.*\ ->\ //' | uniq
}
function vimtemp() {
  vim -c "Tempe $1"
}
function lvim() {
  if [ $# -eq 0 ]; then \
    line=1; \
  else \
    line=$1
  fi; \
  str='sed -n '$line'p | xargs nvim'; \
  eval "$str"; \
}
alias mdt='vimtemp markdown'
alias xvim='xargs nvim'
alias xvimo='xvim -O'
alias fxvim='flon|xvim'
alias fxvimo='flon|xvimo'
alias flvim='flon|lvim'
alias fxvimd='flon|xargs git mergetool'

if [[ $(command -v csview) ]]; then
  function csviews() {
    command iconv -f shift-jis -t UTF8//TRANSLIT $1 | csview --style grid
  }
  function csviewxs() {
    xargs -l -iREPLACE command iconv -f shift-jis -t UTF8//TRANSLIT REPLACE | csview --style grid
  }
  export -f csviews
  alias xcsviews='xargs -I% bash -c "csviews %"'
  alias xcsview='xargs -I% bash -c "csview %"'
fi

# if [[ $(command -v exa) ]]; then
#   alias ll='exa --icons -la'
#   alias l1='exa -1'
#   alias lt='exa -Ta --icons -I "node_modules|.git|.cache|vendor|tmp"'
#   alias ltl='lt | less -r'
# fi

if [[ $(command -v bat) ]]; then
  alias cat='bat --style="grid,header"'
  alias batf='bat --style="full"'
  alias xbat='xargs bat'
  alias xbatf='xargs bat'
  alias fxbat='flon|xbat'
  alias fxbatf='flon|xbatf'
fi
alias xcat='xargs cat'
alias fxcat='flon|xcat'

if [[ $(command -v vivid) ]]; then
  export LS_COLORS="$(vivid generate catppuccin-macchiato)"
fi

# fullpathを表示する
alias fp='readlink -f'

function xrename_paths() {
  if [ $# == 2 ]; then
    xargs ruby -e "require\"fileutils\";ARGV.each{|v|new_n=v.gsub(\"$1\",\"$2\"); FileUtils.mkdir_p(File.dirname(new_n));puts \"#{v} => #{new_n}\"; FileUtils.mv(v, new_n)}"
  else
    echo "argument error. please set from_name, to_name"
  fi
}

# e.g. ルートから見た各ファイルの相対パスを、コピーしたいディレクトリにまるっと階層ごとコピーする
#   `git ls-files --others |cp_with_relative_path ~/git/dev_settings/rx_1/`
function cp_with_relative_path() {
  if [ $# == 1 ]; then
    local save_dir=$1
    shift
    xargs -I {} ruby -e "require\"fileutils\";require\"pathname\"; v1,v2 = ARGV.tap(&method(:p)); to_path = Pathname(v1).join(v2).to_s.tap(&method(:p)); FileUtils.mkdir_p(File.dirname(to_path).tap(&method(:p))); FileUtils.cp_r(v2, to_path)" "$save_dir" {}
    tree -a $save_dir
    # 引数1: 遷移先ディレクトリ, 引数2: パイプでの遷移したいファイルパスの相対パスを複数行
  else
    echo "argument error. please set from_name, to_name"
  fi
}

# cp_with_relative_pathで特定のディレクトリの全ファイルを相対パス通りにシンボリックリンクを貼る
function ln_with_relative_path() {
  if [ $# == 1 ]; then
    local target_dir=$1
    shift
    xargs -I {} ruby -e "require\"fileutils\";require\"pathname\"; v1,v2 = ARGV; to_path = Pathname(v1).join(v2).to_s.tap(&method(:p)); FileUtils.mkdir_p(File.dirname(to_path)); FileUtils.ln_s(Pathname(Dir.pwd).join(v2).to_s, to_path)" "$target_dir" {}
    # 引数1: 遷移先ディレクトリ, 引数2: パイプでの遷移したいファイルパスの相対パスを複数行
  else
    echo "argument error. please set from_name, to_name"
  fi
}

function vimqf() {
  local tempfile=$(mktemp)

  sed -e 's/$/:1:-/' > $tempfile | vim -q $tempfile -c "copen"
}
