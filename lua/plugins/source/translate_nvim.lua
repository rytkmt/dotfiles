require("translate").setup({
})

vim.api.nvim_set_keymap("x", "<Leader>l", ":Translate JA<CR>", { noremap = true, nowait = true })
vim.api.nvim_set_keymap("x", "<Leader>L", ":Translate EN<CR>", { noremap = true, nowait = true })
