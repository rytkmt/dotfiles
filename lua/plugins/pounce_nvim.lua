require'pounce'.setup{
  accept_keys = "JFKDLSAHGNUVRBYTMICEOXWPQZ",
  accept_best_key = "<enter>",
  multi_window = false,
  debug = false,
}

vim.cmd("nmap s <cmd>Pounce<CR>")

vim.cmd("hi! PounceMatch      guifg='#8F7F10' guibg='#000000' gui='NONE'")
vim.cmd("hi! PounceGap        guifg='#6F5F01' guibg='#000000' gui='NONE'")
vim.cmd("hi! PounceAcceptBest guifg='#E85858' guibg='#000000' gui='underline'")
vim.cmd("hi! PounceAccept     guifg='#FFAF60' guibg='#000000' gui='NONE'")
