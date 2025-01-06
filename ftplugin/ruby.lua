require("nvim-surround").buffer_setup({
  surrounds = {
    ["#"] = {
      add = { "#{", "}" },
      find = function() end,
      delete = function() end
    },
  }
})

vim.api.nvim_buf_set_keymap(0, "n", "gf", "<cmd>lua require'rytkmt.formatter'.rubocop()<cr>", { noremap = true })
