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
alias als="alias | sort | sed s/^alias\.// | sed -e 's/=/ /' | awk '{printf \"%-10s %s\",\$1,c=\"\";for(i=2;i<=NF;i++) c=c \$i\" \"; print c}' | sed s/\'// | sed s/\'//"
alias ebr='vim $XDG_CONFIG_HOME/.bashrc'
alias ebp='vim $XDG_CONFIG_HOME/.bash_profile'
alias ebrl='vim $HOME/.bashrc'
alias ebpl='vim $HOME/.bash_profile'
alias egc='vim $XDG_CONFIG_HOME/.gitconfig'
alias cdv='cd $XDG_CONFIG_HOME'
alias sbr='source $HOME/.bashrc'
export EDITOR="nvim"

function flon() {
  sed -e 's/:.*$//' | grep -v '^D' | sed -e 's/^\s\?[AMUR\?]\{1,2\}\s\+//' | sed -e 's/^.*\ ->\ //' | uniq
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
fi

if [[ $(command -v exa) ]]; then
  alias ll='exa --icons -la'
  alias l1='exa -1'
  alias lt='exa -Ta --icons -I "node_modules|.git|.cache|vendor|tmp"'
  alias ltl='lt | less -r'
else
  alias ll='ls -la'
  alias l1='ls -1'
  alias lt='tree -I "node_modules|.git|.cache|vendor|tmp"'
  alias ltl='lt | less -r'
fi

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
  export LS_COLORS="$(vivid generate ayu)"
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
