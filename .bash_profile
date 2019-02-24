current_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# export PS1='\h \[\033[1;33m\]\W \[\033[0m\]$(parse_git_branch)$ '
function prompt {
    # 色は気分で変えたいかもしれないので変す宣言しておく
    local  LIGHT_BLUE="\[\e[36m\]"
    local  PURPLE="\[\e[95m\]"
    local  WHITE="\[\e[0m\]"
    export PS1="${LIGHT_BLUE}\w [\u]${PURPLE}\$(parse_git_branch)${WHITE} \$ "
}
prompt
export XDG_CONFIG_HOME=$current_dir
export DOT_FILES=$XDG_CONFIG_HOME
export MYVIMRC=$DOT_FILES/vimrc.vim
export TERM=xterm-color256
