require('treesj').setup({
  use_default_keymaps = false
})
vim.keymap.set('n', 'gl', require('treesj').toggle)
