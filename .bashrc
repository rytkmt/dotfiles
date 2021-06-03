# xargsをパイプで実行するときに引数にエイリアスを使えるようにする
alias xargs='xargs '
alias vim='nvim'
alias sudo="sudo env PATH=$PATH"
alias als="alias | sort | sed s/^alias\.// | sed -e 's/=/ /' | awk '{printf \"%-10s %s\",\$1,c=\"\";for(i=2;i<=NF;i++) c=c \$i\" \"; print c}' | sed s/\'// | sed s/\'//"
alias ebrl='vim $HOME/.bashrc'
alias ebpl='vim $HOME/.bash_profile'
alias egc='vim $HOME/.gitconfig'
alias cdv='cd $XDG_CONFIG_HOME'
alias sbr='source $HOME/.bashrc'
export EDITOR="nvim"

function flon() {
  sed -e 's/:.*$//' | sed -e 's/^\s\?[ADMU\?]\{1,2\}\s\+//' | uniq
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

function csviews() {
  command iconv -f shift-jis -t UTF8//TRANSLIT $1 | csview --style grid
}

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
  alias bat='bat --style="numbers,grid"'
  alias cat='bat --style="grid"'
  alias batf='bat --style="full"'
  alias xbat='xargs bat'
  alias fxbat='flon|xbat'
fi
alias xcat='xargs cat'
alias fxcat='flon|xcat'

if [[ $(command -v vivid) ]]; then
  export LS_COLORS="$(vivid generate ayu)"
fi

# fullpathを表示する
alias fp='readlink -f'
