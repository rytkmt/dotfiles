require("translate").setup({
  preset = {
      output = {
          insert = {
              base = "top",
              off = -1,
          },
      },
  },
})

vim.api.nvim_set_keymap("x", "<Leader>l", ":Translate JA<CR>", { noremap = true, nowait = true })
vim.api.nvim_set_keymap("x", "<Leader>L", ":Translate EN<CR>", { noremap = true, nowait = true })
vim.api.nvim_set_keymap("x", "<Leader>gl", ":Translate JA -output=insert<CR>", { noremap = true, nowait = true })
vim.api.nvim_set_keymap("x", "<Leader>gL", ":Translate EN -output=insert<CR>", { noremap = true, nowait = true })
