require("surround").setup {
  load_keymaps = false,

  quotes = {"'", '"', '`'},
  brackets = {"(", '{', '['},
  pairs = {
    nestable = {
      {"(", ")"},
      {"[", "]"},
      {"{", "}"},
    },
    linear = {
      {"'", "'"},
      {"`", "`"},
      {'"', '"'}
    }
  },
}

local function map(mode, key, cmd)
  vim.api.nvim_set_keymap(mode, key, cmd, { noremap = true })
end

-- Special Maps
map("n", "ys", "<cmd>set operatorfunc=SurroundAddOperatorMode<cr>g@")
-- Cycle surrounding quotes
map("n", "cq", "<cmd>lua require'surround'.toggle_quotes()<cr>")
-- Normal Mode Maps
-- Surround Add
map("v", "S", "<esc>gv<cmd>lua require'surround'.surround_add()<cr>")
-- Surround Delete
map("n", "ds", "<cmd>lua require'surround'.surround_delete()<cr>")
-- Surround Replace
map("n", "cs", "<cmd>lua require'surround'.surround_replace()<cr>")
