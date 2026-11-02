require("kiro_skills").setup()
require("telescope").load_extension("kiro_skills")

vim.api.nvim_set_keymap(
  "n",
  "[finder];",
  "<cmd>Telescope kiro_skills<CR>",
  { noremap = true, silent = true, nowait = true }
)
