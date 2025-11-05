-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local on_attach = function (client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'ge', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>vs | lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gs', '<cmd>sp | lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.keymap.set('c', '<tab>', '<C-z>', { silent = false })

  if client.server_capabilities.documentSymbolProvider then
    vim.api.nvim_buf_set_var(0, 'navic_enabled', true)
    vim.wo.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    require("nvim-navic").attach(client, bufnr)
  end
end

vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = on_attach
})

local lua_ls_opts = require('lsp.lua_ls')
vim.lsp.config('lua_ls', lua_ls_opts)
vim.lsp.enable('lua_ls')

local ruby_lsp_opts = require('lsp.ruby_lsp')
vim.lsp.config('ruby_lsp', ruby_lsp_opts)
vim.lsp.enable('ruby_lsp')

local yamlls_opts = require("lsp.yamlls")
vim.lsp.config("yamlls", yamlls_opts)
vim.lsp.enable("yamlls")

vim.lsp.config("marksman", {})
vim.lsp.enable("marksman")
