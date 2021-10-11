let g:UltiSnipsEditSplit = "tabdo"
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<nop>"
let g:UltiSnipsJumpBackwardTrigger="<nop>"
let g:UltiSnipsSnippetDirectories=[$XDG_CONFIG_HOME.'/ultisnips']
inoremap <silent> <C-n> <Esc>:call UltiSnips#JumpForwards()<CR>
snoremap <silent> <C-n> <Esc>:call UltiSnips#JumpForwards()<CR>
inoremap <silent> <C-p> <Esc>:call UltiSnips#JumpBackwards()<CR>
snoremap <silent> <C-p> <Esc>:call UltiSnips#JumpBackwards()<CR>

nmap [other]n :UltiSnipsEdit<CR>
