require('nvim-treesitter').install({ "lua", "ruby", "markdown", "yaml", "json" })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { "lua", "ruby", "markdown", "json" },
  callback = function() vim.treesitter.start() end,
})