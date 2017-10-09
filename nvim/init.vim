exe "so $XDG_CONFIG_HOME/vimrc.vim"

if has('mac')
elseif has('unix')
  let g:python3_host_prog = expand('/usr/bin/python3')
endif
