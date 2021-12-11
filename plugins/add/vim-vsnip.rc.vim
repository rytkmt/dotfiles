" let g:UltiSnipsEditSplit = "tabdo"
" let g:UltiSnipsRemoveSelectModeMappings = 0
" let g:UltiSnipsExpandTrigger="<C-s>"
" let g:UltiSnipsJumpForwardTrigger="<nop>"
" let g:UltiSnipsJumpBackwardTrigger="<nop>"
" let g:UltiSnipsSnippetDirectories=[$XDG_CONFIG_HOME.'/ultisnips']
let g:vsnip_snippet_dir = $XDG_CONFIG_HOME.'/.vsnip'

imap <expr> <C-s>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-s>'
smap <expr> <C-s>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-s>'

imap <expr> <C-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-n>'
smap <expr> <C-n>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-n>'
imap <expr> <C-p> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-p>'
smap <expr> <C-p> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-p>'

nmap [other]n :VsnipOpenVsplit<CR>
