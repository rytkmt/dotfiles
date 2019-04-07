function! s:terminal_open()
  let g:terminal_color_0  = "#1b2b34" "black
  let g:terminal_color_1  = "#cd6f77" "red
  let g:terminal_color_2  = "#5aaa65" "green
  let g:terminal_color_3  = "#fbc963" "yellow
  let g:terminal_color_4  = "#50b0b0" "cyan
  let g:terminal_color_5  = "#c695c6" "magenta
  let g:terminal_color_6  = "#669acd" "blue
  let g:terminal_color_7  = "#c1c6cf" "white
  let g:terminal_color_8  = "#65737e" "bright black
  let g:terminal_color_9  = "#fa9257" "bright red
  let g:terminal_color_10 = "#9ae875" "bright green
  let g:terminal_color_11 = "#fbc963" "bright yellow
  let g:terminal_color_12 = "#a8aebb" "bright blue
  let g:terminal_color_13 = "#b098df" "bright magenta
  let g:terminal_color_14 = "#ac7967" "bright cyan
  let g:terminal_color_15 = "#d9dfea" "bright white
  let g:terminal_color_background="#1b2b34" "background
  let g:terminal_color_foreground="#c1c6cf" "foreground
endfunction

augroup MyTerminalOpen
  autocmd!
  autocmd BufEnter * if &buftype == 'terminal' | call s:terminal_open() | endif
augroup END
