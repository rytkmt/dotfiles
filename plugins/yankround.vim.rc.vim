nmap p <Plug>(yankround-p)
vmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
vmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
vmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
vmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
vmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
vmap <C-n> <Plug>(yankround-next)
"yankのペーストにハイライトを使用するか
let g:yankround_use_region_hl = 1
let g:yankround_max_history = 10
let g:yankround_dir = "~/.vim/cache/yankround"

if has("gui_running") || has('gui') || has('nvim')
  autocmd ColorScheme * hi! YankRoundRegion gui=underline guifg=#293239 guibg=#a4a4b2

else
endif
