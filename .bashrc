alias vim='nvim'
alias ll='ls -la'
alias sudo="sudo env PATH=$PATH"
alias als="alias | sort | sed s/^alias\.// | sed -e 's/=/ /' | awk '{printf \"%-10s %s\",\$1,c=\"\";for(i=2;i<=NF;i++) c=c \$i\" \"; print c}' | sed s/\'// | sed s/\'//"
alias ebrl='vim $HOME/.bashrc'
alias ebpl='vim $HOME/.bash_profile'
alias egc='vim $HOME/.gitconfig'
alias cdv='cd $XDG_CONFIG_HOME'

function flon() {
  sed -e 's/:.*$//' |  uniq
}
alias flon=flon
function vimtemp() {
  vim -c "Tempe $1"
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
