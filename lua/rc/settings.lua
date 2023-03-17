vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "single", -- "shadow" , "none", "rounded"
    -- border = border
    -- width = 100,
  }
)
