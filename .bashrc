alias vim='nvim'
alias ll='ls -la'
alias sudo="sudo env PATH=$PATH"
alias als="alias | sort | sed s/^alias\.// | sed -e 's/=/ /' | awk '{printf \"%-10s %s\",\$1,c=\"\";for(i=2;i<=NF;i++) c=c \$i\" \"; print c}' | sed s/\'// | sed s/\'//"

alias be='rbenv exec bundle exec'
alias bi='rbenv exec bundle install --path=vendor/bundle --clean'
alias bu='rbenv exec bundle update'
alias re='rbenv'

alias dev='be rails s -b 0.0.0.0'
alias con='be rails c'
alias rs='be rspec'
alias rsf='bundle exec rspec --only-failures'
alias rsn='NO_MIGRATE=true bundle exec rspec'
alias rsnf='NO_MIGRATE=true bundle exec rspec --only-failures'
