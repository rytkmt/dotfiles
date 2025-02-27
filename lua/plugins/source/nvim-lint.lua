local ruby = require('lint').linters.ruby
ruby.cmd = 'rbenv'
ruby.args = {  'exec', 'ruby', '-w', '-c' }

local rubocop = require('lint').linters.rubocop
rubocop.cmd = 'bundle'
rubocop.args = {
  'exec',
  'rubocop',
  '--format',
  'json',
  '--force-exclusion',
  -- '--server',
  '--stdin',
  function() return vim.api.nvim_buf_get_name(0) end,
}

local rubocop_severity_map = {
  ['fatal'] = vim.diagnostic.severity.ERROR,
  ['error'] = vim.diagnostic.severity.ERROR,
  ['warning'] = vim.diagnostic.severity.WARN,
  ['convention'] = vim.diagnostic.severity.HINT,
  ['refactor'] = vim.diagnostic.severity.INFO,
  ['info'] = vim.diagnostic.severity.INFO,
}
local old_parser = rubocop.parser
rubocop.parser = function(output, bufnr)
  local diagnostics = old_parser(output, bufnr)
  for _, diagnostic in ipairs(diagnostics) do
    -- 診断結果の表示のためにcopに変更
    diagnostic.source = 'cop'
  end
  return diagnostics
end
require('lint').linters_by_ft = {
  ruby = {
    "ruby", "rubocop"
  },
  lua = { 'luacheck' },
  json = { 'jsonlint' }
}
-- InsertLeaveはstdinを受け付けているケースのみしか使えないためrubyは不可
vim.api.nvim_create_autocmd(
  { "BufWinEnter", "BufWritePost" },
  {
    callback = function()
      local bufname = vim.api.nvim_buf_get_name(0)
      if not string.match(bufname, "diffview:///") then
        require("lint").try_lint()
      end
    end
  }
)

-- 診断結果の表示/非表示を切り替える関数
local function toggle_diagnostics()
  if vim.b.diagnostics_enabled == nil or vim.b.diagnostics_enabled == true then
    vim.b.diagnostics_enabled = false
    vim.diagnostic.disable(0)
    print("Diagnostics disabled")
  else
    vim.b.diagnostics_enabled = true
    vim.diagnostic.enable(0)
    print("Diagnostics enabled")
  end
end

-- コマンドを作成
vim.api.nvim_create_user_command('ToggleDiagnostics', toggle_diagnostics, {})
