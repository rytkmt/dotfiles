yaml = require("yaml_nvim")
yaml.setup({ ft = { "yaml" } })

-- vim.api.nvim_set_keymap("n", "[ft]f", ":lua require('yaml_nvim').get_yaml_key()<CR>", { noremap = true, nowait = true })
vim.keymap.set("n", "[ft]f", function() vim.notify(require('yaml_nvim').get_yaml_key()) end, { noremap = true, nowait = true })
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold" }, {
  pattern = { "*.yml", "*.yaml" },
  callback = function()
    local current_line_number = vim.api.nvim_win_get_cursor(0)[1]
    -- 行数が変わっていないなら処理を抜ける
    if vim.api.nvim_eval('exists("b:last_line_number")') == 1 then
      local last_line_number = vim.api.nvim_buf_get_var(0, "last_line_number")
      if last_line_number == current_line_number then
        return
      end
    end
    vim.api.nvim_buf_set_var(0, "last_line_number", current_line_number)
    vim.opt_local.winbar = require("yaml_nvim").get_yaml_key()
  end,
})
vim.api.nvim_set_keymap("n", "[ft]c", ":YAMLYankKey <CR>", { noremap = true, nowait = true })
vim.api.nvim_set_keymap("n", "[ft]l", ":YAMLTelescope <CR>", { noremap = true, nowait = true })
