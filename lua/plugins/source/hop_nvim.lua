require('hop').setup {
  keys = 'jfkdlsahgnuvrbytmiceoxwpqz'
}
vim.api.nvim_set_keymap("n", "<Leader>:m", ":HopLineMW<CR>", { noremap = false, silent = false, nowait = true })
vim.api.nvim_set_keymap("n", "<Leader>:l", ":HopLine<CR>", { noremap = false, silent = false, nowait = true })
vim.api.nvim_set_keymap("n", "<Leader>:j", ":HopLineAC<CR>", { noremap = false, silent = false, nowait = true })
vim.api.nvim_set_keymap("n", "<Leader>:k", ":HopLineBC<CR>", { noremap = false, silent = false, nowait = true })
vim.api.nvim_set_keymap("n", "<Leader>,", ":HopAnywhere<CR>", { noremap = false, silent = false, nowait = true })
vim.api.nvim_set_keymap("n", "<Leader><", ":HopAnywhereMW<CR>", { noremap = false, silent = false, nowait = true })
vim.api.nvim_set_keymap("n", "<Leader>:f", ":HopAnywhereCurrentLineAC<CR>", { noremap = false, silent = false, nowait = true })
vim.api.nvim_set_keymap("n", "<Leader>:F", ":HopAnywhereCurrentLineBC<CR>", { noremap = false, silent = false, nowait = true })

vim.cmd("hi! HopNextKey  guifg='#E85858' guibg='#000000' gui='underline'")
vim.cmd("hi! HopNextKey1 guifg='#FFAF60' guibg='#000000' gui='NONE'")
vim.cmd("hi! HopNextKey2 guifg='#8F7F10' guibg='#000000' gui='NONE'")
