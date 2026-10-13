require('nvim-treesitter').install({ "lua", "ruby", "markdown", "yaml", "json", "javascript", "typescript", "tsx", "html", "css" })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { "lua", "ruby", "markdown", "json", "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "css" },
  callback = function() vim.treesitter.start() end,
})
