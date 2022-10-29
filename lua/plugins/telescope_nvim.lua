local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

require('telescope').setup{
  defaults = {
    preview = { hide_on_startup = true, treesitter = false  },
    sorting_strategy = "ascending",
    scroll_strategy = "limit",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
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
vim.api.nvim_set_keymap('n', '[finder]if', ':lua require("telescope.builtin").find_files({cwd = vim.call("InputPath")})<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]g', ':lua require("telescope.builtin").live_grep({cwd = vim.call("FindGitProjectRoot")})<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]ig', ':lua require("telescope.builtin").live_grep({cwd = vim.call("InputPath")})<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]G', ':lua require("telescope.builtin").grep_string({cwd = vim.call("FindGitProjectRoot")})<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]iG', ':lua require("telescope.builtin").grep_string({cwd = vim.call("InputPath")})<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]b', ':lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]m', ':lua require("telescope.builtin").oldfiles()<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]h', ':lua require("telescope.builtin").highlights()<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '[finder]l', ':lua require("telescope.builtin").buffers()<CR>', { noremap = true, silent = true, nowait = true })
