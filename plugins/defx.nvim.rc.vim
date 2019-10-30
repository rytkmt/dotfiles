" let g:defx_tab_cnt = 1
let g:defx_is_new = 1
function! _DefxOpen(init, type)
  " if !exists("t:tab_name")
  "   " タブ番号保持
  "   let t:tab_name = g:defx_tab_cnt
  "   let g:defx_tab_cnt = g:defx_tab_cnt + 1
  " endif

" nnoremap <silent> [filer]d :<C-u>Defx -listed -resume -buffer-name=tab`tabpagenr()`

  " explorerの場合
  " let l:open_cmd = ":Defx -split=vertical -direction=topleft -toggle -resume -ignored-files='.git' -winwidth=30 -buffer-name=tab`tabpagenr()`"

  " floatingの場合
  let l:open_cmd = ":Defx -split=floating -resume -ignored-files='.git' -wincol=`&columns / 8` -winrow=`&lines / 10` -winheight=`&lines / 10 * 8` -buffer-name=tab`tabpagenr()`"

  let l:defx_default_dir = ''

  if a:type == 1 && (a:init || g:defx_is_new)
    let g:defx_is_new = 0
    let l:defx_default_dir = $FILER_DEFAULT
    if empty(l:defx_default_dir)
      let l:defx_default_dir = $XDG_CONFIG_HOME
    endif
    if !isdirectory(l:defx_default_dir)
      let l:defx_default_dir = $HOME
    endif
    exe l:open_cmd . " " . fnamemodify(l:defx_default_dir, ':p')
  elseif a:type == 1
    exe l:open_cmd
  elseif a:type == 2
    " カレントディレクトリ
    let l:defx_default_dir = expand("%:p:h")
    exe l:open_cmd . " " . fnamemodify(l:defx_default_dir, ':p')
  elseif a:type == 3
    " カレントディレクトリ
    let l:defx_default_dir = $XDG_CONFIG_HOME
    exe l:open_cmd . " " . fnamemodify(l:defx_default_dir, ':p')
  endif


endfunction

nmap [filer]f :<C-u>call _DefxOpen(0,1)<CR>
nmap [filer]d :<C-u>call _DefxOpen(1,1)<CR>
nmap [filer]b :<C-u>call _DefxOpen(1,2)<CR>
nmap [filer]v :<C-u>call _DefxOpen(1,3)<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " 半透明化
  setl winblend=18

  " explorerの場合
  " nnoremap <silent><buffer><expr> l     defx#do_action('drop')
  " nnoremap <silent><buffer><expr> L     defx#do_action('drop')
  " nnoremap <silent><buffer><expr> s     defx#do_action('open', 'split')
  " nnoremap <silent><buffer><expr> v     defx#do_action('open', 'vsplit')

  " floatingの場合
  nnoremap <silent><buffer><expr> l     defx#is_directory() ? defx#do_action('open') : defx#do_action('multi', ['quit', 'open'])
  nnoremap <silent><buffer><expr> L     defx#is_directory() ? defx#do_action('open') : defx#do_action('multi', ['quit', 'open'])
  nnoremap <silent><buffer><expr> s     defx#is_directory() ? defx#do_action('open') : defx#do_action('multi', ['quit', [ 'open', 'split' ]])
  nnoremap <silent><buffer><expr> v     defx#is_directory() ? defx#do_action('open') : defx#do_action('multi', ['quit', [ 'open', 'vsplit' ]])


  " Define mappings
  nnoremap <silent><buffer><expr> e     defx#do_action('open')
  nnoremap <silent><buffer><expr> <CR>  defx#do_action('open')
  nnoremap <silent><buffer><expr> c     defx#do_action('copy')
  nnoremap <silent><buffer><expr> m     defx#do_action('move')
  nnoremap <silent><buffer><expr> p     defx#do_action('paste')
  nnoremap <silent><buffer><expr> P     defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o     defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> ad     defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> af     defx#do_action('new_file')
  nnoremap <silent><buffer><expr> amf     defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C     defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S     defx#do_action('toggle_sort',   'time')
  nnoremap <silent><buffer><expr> d     defx#do_action('remove')
  nnoremap <silent><buffer><expr> r     defx#do_action('rename')
  nnoremap <silent><buffer><expr> !     defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x     defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy    defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;     defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h     defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~     defx#do_action('cd')
  nnoremap <silent><buffer><expr> q     defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Esc> defx#do_action('quit')
  nnoremap <silent><buffer><expr> +     defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *     defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j     line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k     line('.') == 1         ? 'G'  : 'k'
  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd    defx#do_action('change_vim_cwd')
endfunction
