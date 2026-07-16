vim.keymap.set("n", "[ft]s", function()
  local prev_text = vim.fn.getreg('"', true)
  vim.cmd('normal! yi"')
  local plugin_name = require("rytkmt/utils/split").split(vim.fn.getreg('"', 1), "/")[2]
  plugin_name = string.gsub(plugin_name, "[.]", "_")

  vim.fn.setreg('"', prev_text)
  vim.cmd("vs $XDG_CONFIG_HOME/lua/plugins/source/" .. plugin_name .. ".lua")
end, { desc = "vsplit source_lua file", noremap = true, silent = true, buffer = 0 })
