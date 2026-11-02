require("emj_picker").setup({
  -- J / K move 3 rows at a time inside the picker, matching the global
  -- J -> 3j / K -> 3k mappings.
  scroll_step = 3,
})

-- Open the pickers under the existing [finder] submode prefix.
--   [finder]e -> emoji grid picker
--   [finder]n -> Nerd Font glyph picker
vim.api.nvim_set_keymap(
  "n",
  "[finder]e",
  "<cmd>EmjPicker<CR>",
  { noremap = true, silent = true, nowait = true }
)
vim.api.nvim_set_keymap(
  "n",
  "[finder]n",
  "<cmd>EmjPickerNerd<CR>",
  { noremap = true, silent = true, nowait = true }
)
