local M = {}
local pathutil = require("rytkmt.utils.path")

M.rubocop = function()
  local rubocop_yml_path = pathutil.make_full_path_under_root(".rubocop.yml")

  if not pathutil.path.exists(rubocop_yml_path) then
    return nil
  end

  -- Supports conditional formatting
  -- if util.get_current_buffer_file_name() == "special.lua" then
  --   return nil
  -- end

  -- Full specification of configurations is down below and in Vim help
  -- files
  --
  command_args = {
    "bundle",
    "exec",
    "rubocop",
    "-a",
    vim.fn.expand("%:p"),
    "--config",
    rubocop_yml_path,
  }

  local result = vim.fn.system(table.concat(command_args, " "))
  -- 再度開き直し
  vim.cmd('edit')
  -- ANSIエスケープシーケンスを表す正規表現パターン
  local ansi_pattern = '\27%[[0-9;]*[mK]'
  -- 正規表現に一致する部分を空文字に置き換える
  print(result:gsub(ansi_pattern, ''))
end

return M
