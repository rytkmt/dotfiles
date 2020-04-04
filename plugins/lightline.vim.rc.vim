let g:lightline = {
\  'colorscheme': 'one',
\  'active': {
\    'left': [['mode', 'paste'], ['filename'], ['gitstatus']],
\    'right': [['row'], ['fileencoding'], ['filetype'], ['projecttag'], ['fileformat'], ['codepoint']]
\  },
\  'inactive': {
\    'left': [['filename']],
\    'right': [['row'], ['fileencoding'], ['filetype'], ['projecttag'], ['fileformat']]
\  },
\  'component': {
\    'codepoint': '%B'
\  },
\  'component_function': {
\    'mode': 'LightlineMode',
\    'paste' : 'LightlinePaste',
\    'readonly' : 'LightlineReadonly',
\    'filename' : 'LightlineFilename',
\    'modified' : 'LightlineModified',
\    'row' : 'LightlineRow',
\    'fileencoding': 'LightlineFileencoding',
\    'filetype': 'LightlineFiletype',
\    'projecttag': 'LightlineProjecttag',
\    'gitstatus': 'LightlineGitStatus',
\    'fileformat': 'LightlineFileFormat',
\  }
\}
let s:default_palette = g:lightline#colorscheme#default#palette
let s:p = s:default_palette
function! LightlineMode()
  return &ft == 'vimfiler' ? '' : lightline#mode()
endfunction
function! LightlinePaste()
  return &ft == 'vimfiler' ? '' : &paste ? "PASTE" : ""
endfunction
function! LightlineReadonly()
  return &ft != 'vimfiler' && &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction
function! LightlineFilename()
  let l:fugitive = ' '
  try
    call function("FugitiveHead")
    let l:fugitive_head = FugitiveHead()
    if l:fugitive_head != ""
      let l:fugitive = ' ('. FugitiveHead(). ')'
    endif
  catch
  endtry

  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
    \ (&ft == 'vimfiler' ? len(b:vimfiler.current_dir) > 1 ? split(b:vimfiler.current_dir, "/")[-1] : '' :
    \  &ft == 'unite' ? unite#get_status_string() :
    \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
    \ ('' != LightlineModified() ? ' ' . LightlineModified() : '') .
    \ l:fugitive
endfunction
function! LightlineModified()
  return &modifiable && &modified ? '+' : ''
endfunction
function! LightlineRow()
  return &ft == 'vimfiler' ? '' : line(".") . "/" . line("$")
endfunction
function! LightlineFileencoding()
  return &ft == 'vimfiler' ? '' : &encoding
endfunction
function! LightlineFiletype()
  return &ft == 'vimfiler' ? '' : (&ft == '' ? 'no_ft' : &ft)
endfunction
function! LightlineProjecttag()
  return exists('w:project_tag') ? 'T' : ''
endfunction
function! LightlineGitStatus()
  let status = get(g:, 'coc_git_status', '')
  let status = substitute(status, "[^a-zA-Z0-9-_]", "", "g")
  return "(".status.")"
  " return winwidth(0) > 120 ? status : ''
endfunction
function! LightlineFileFormat()
  return &ft == 'vimfiler' ? '' : &ff
endfunction

let s:p.normal.left[1] = ['#b15e7c', '#222529', 1, 1]
let s:p.inactive.left[0] = ['#b15e7c', '#222529', 1, 1]
let s:p.normal.right[2] = ['#323232', '#d75f00', 1, 1]
let g:lightline#colorscheme#yourcolorscheme#palette = s:p
call lightline#init()
call lightline#update()
