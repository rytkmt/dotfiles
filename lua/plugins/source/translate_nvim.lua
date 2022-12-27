require("translate").setup({
})

vim.api.nvim_set_keymap("x", "<Leader>l", ":Translate JA<CR>", { noremap = true, nowait = true })
