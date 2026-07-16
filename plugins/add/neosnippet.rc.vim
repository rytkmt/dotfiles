imap <C-s>     <Plug>(neosnippet_expand_or_jump)
smap <C-s>     <Plug>(neosnippet_expand_or_jump)
xmap <C-s>     <Plug>(neosnippet_expand_target)

let g:neosnippet#snippets_directory='$XDG_CONFIG_HOME/snippets/'
nmap [other]n :NeoSnippetEdit<CR>
