alias vim='nvim'
alias ll='ls -la'
alias als="alias | sort | sed s/^alias\.// | sed -e 's/=/ /' | awk '{printf \"%-10s %s\",\$1,c=\"\";for(i=2;i<=NF;i++) c=c \$i\" \"; print c}' | sed s/\'// | sed s/\'//"
