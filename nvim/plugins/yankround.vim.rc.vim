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
nnoremap <silent> [unite]y :<C-u>Unite<Space>yankround<CR>
"yankのペーストにハイライトを使用するか
let g:yankround_use_region_hl = 1
autocmd MyAutoCmd ColorScheme * highlight YankRoundRegion gui=underline guifg=White guibg=Black
