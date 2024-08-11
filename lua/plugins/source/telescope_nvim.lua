local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
require('telescope').load_extension('arglist')
require('telescope').setup{
  defaults = {
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    preview = { hide_on_startup = true, treesitter = false, timeout = 1000 },
    sorting_strategy = "ascending",
    scroll_strategy = "limit",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        height = 0.95,
        prompt_position = "top",
        width = 0.9
      },
    },
    prompt_prefix = "$ ",
    history = {
      limit = 30
    },
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-q>"] = function(prompt_bufnr)
          actions.send_to_qflist(prompt_bufnr)
          vim.cmd [[copen]]
        end,
        ["<C-a>"] = actions.add_to_qflist,
        ["<C-[>"] = actions.close,
        ["<esc>"] = actions.close,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<C-f>"] = action_layout.toggle_preview,
        ["<CR>"] = actions.select_default,
      },
      n = {
        ["?"] = actions.which_key,
      }
    },
    file_ignore_patterns = {
      "%.pdf"
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      -- "--smart-case"
      "--case-sensitive",
    }
  },
  pickers = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      -- "--smart-case"
      "--case-sensitive",
    }
  }
}
vim.api.nvim_set_keymap('n', '[finder]f', ':lua require("telescope.builtin").find_files({cwd = vim.call("FindGitProjectRoot")})<CR>', { noremap = true, silent = true, nowait = true })
-- vim.api.nvim_set_keymap('n', '[finder]F', ':lua require("telescope.builtin").find_files({cwd = vim.call("FindGitProjectRoot")})<CR>i', {})
vim.keymap.set('n', '[finder]<C-f>', function()
  local filename = vim.fn.substitute(vim.fn.expand("%:t"), "\\.[a-zA-Z]*$", "", "")
  return ':lua require("telescope.builtin").find_files({cwd = vim.call("FindGitProjectRoot"), search_file = "'.. filename .. '"})<CR>'
end, { expr = true, noremap = true, silent = true, nowait = true })
vim.keymap.set('n', '[finder]F', function()
  return ':lua require("telescope.builtin").find_files({cwd = vim.call("FindGitProjectRoot"), search_file = "'.. vim.fn.expand("<cword>") .. '"})<CR>'
end, { expr = true, noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]if', ':lua require("telescope.builtin").find_files({cwd = vim.call("InputPath")})<CR>', { noremap = true, silent = true, nowait = true })
if os.getenv("WORK_MEMO_DIR") then
  vim.api.nvim_set_keymap('n', '[finder]M', ':lua require("telescope.builtin").find_files({cwd = "$WORK_MEMO_DIR/"})<CR>', { noremap = true, silent = true, nowait = true })
end
vim.api.nvim_set_keymap('n', '[finder]s', ':lua require("telescope.builtin").find_files({cwd = "$XDG_CONFIG_HOME/source_memo/"})<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]g', ':lua require("telescope.builtin").live_grep({cwd = vim.call("FindGitProjectRoot")})<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]ig', ':lua require("telescope.builtin").live_grep({cwd = vim.call("InputPath")})<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]G', ':lua require("telescope.builtin").grep_string({cwd = vim.call("FindGitProjectRoot")})<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]iG', ':lua require("telescope.builtin").grep_string({cwd = vim.call("InputPath")})<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]b', ':lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]o', ':lua require("telescope.builtin").oldfiles()<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]m', ':lua require("telescope.builtin").marks()<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]h', ':lua require("telescope.builtin").highlights()<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]l', ':lua require("telescope.builtin").loclist()<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]a', ':lua require("telescope-arglist").arglist()<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]k', ':lua require("telescope.builtin").keymaps()<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]c', ':lua require("telescope.builtin").commands()<CR>', { noremap = true, silent = true, nowait = true })
