local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  use_icons = true,         -- Requires nvim-web-devicons
  icons = {                 -- Only applies when use_icons is true.
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
  },
  file_panel = {
    win_config = {
      position = "left",                  -- One of 'left', 'right', 'top', 'bottom'
      width = 35,                         -- Only applies when position is 'left' or 'right'
      height = 10,                        -- Only applies when position is 'top' or 'bottom'
    },
    listing_style = "tree",             -- One of 'list' or 'tree'
    tree_options = {                    -- Only applies when listing_style is 'tree'
      flatten_dirs = true,              -- Flatten dirs that only contain one single dir
      folder_statuses = "only_folded",  -- One of 'never', 'only_folded' or 'always'.
    },
  },
  file_history_panel = {
    win_config = {
      position = "bottom",
      width = 35,
      height = 16,
    },
    log_options = {
      single_file = {
        -- max_count = 256,      -- Limit the number of commits
        follow = true,       -- Follow renames (only for single file)
        first_parent = false,       -- Follow only the first parent upon seeing a merge commit.
        all = false,          -- Include all refs under 'refs/' including HEAD
        merges = false,       -- List only merge commits
        no_merges = true,    -- List no merge commits
        reverse = false,      -- List commits in reverse order
        diff_merges = "first-parent"
      },
      multi_file = {
        -- max_count = 256,
        all = false,          -- Include all refs under 'refs/' including HEAD
        merges = false,       -- List only merge commits
        no_merges = false,    -- List no merge commits
        reverse = false,      -- List commits in reverse order
        diff_merges = "first-parent"
      },
    },
  },
  default_args = {    -- Default args prepended to the arg-list for the listed commands
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
  hooks = {},         -- See ':h diffview-config-hooks'
  key_bindings = {
    disable_defaults = false,                   -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["[diff]e"]    = cb("goto_file"),          -- Open the file in a new split in previous tabpage
      ["[diff]s"]    = cb("goto_file_split"),    -- Open the file in a new split
      ["[diff]t"]    = cb("goto_file_tab"),      -- Open the file in a new tabpage
      ["[diff]f"]    = cb("focus_files"),        -- Bring focus to the files panel
      ["[diff]b"]    = cb("toggle_files"),       -- Toggle the files panel.
      ["[diff]j"]    = cb("select_next_entry"),           -- Bring the cursor to the next file entry
      ["[diff]k"]    = cb("select_prev_entry"),
    },
    file_panel = {
      ["j"]             = cb("next_entry"),           -- Bring the cursor to the next file entry
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),           -- Bring the cursor to the previous file entry.
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),         -- Open the diff for the selected entry.
      ["o"]             = cb("select_entry"),
      ["-"]             = cb("toggle_stage_entry"),   -- Stage / unstage the selected entry.
      ["S"]             = cb("stage_all"),            -- Stage all entries.
      ["U"]             = cb("unstage_all"),          -- Unstage all entries.
      ["X"]             = cb("restore_entry"),        -- Restore entry to the state on the left side.
      ["R"]             = cb("refresh_files"),        -- Update stats and entries in the file list.
      ["e"]             = cb("goto_file"),
      ["s"]             = cb("goto_file_split"),
      ["t"]             = cb("goto_file_tab"),
      ["i"]             = cb("listing_style"),        -- Toggle between 'list' and 'tree' views
      ["f"]             = cb("toggle_flatten_dirs"),  -- Flatten empty subdirectories in tree listing style.
    },
    file_history_panel = {
      ["g!"]            = cb("options"),            -- Open the option panel
      ["<C-A-d>"]       = cb("open_in_diffview"),   -- Open the entry under the cursor in a diffview
      ["y"]             = cb("copy_hash"),          -- Copy the commit hash of the entry under the cursor
      ["zR"]            = cb("open_all_folds"),
      ["zM"]            = cb("close_all_folds"),
      ["j"]             = cb("next_entry"),
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),
      ["o"]             = cb("select_entry"),
      ["e"]             = cb("goto_file"),
      ["s"]             = cb("goto_file_split"),
      ["t"]             = cb("goto_file_tab"),
    },
    option_panel = {
      ["<tab>"] = cb("select"),
      ["q"]     = cb("close"),
    },
  },
}

function _G.diffview_open_current_file()
  vim.cmd(":DiffviewOpen -- " .. vim.fn.expand("%"))
  return
end

vim.api.nvim_set_keymap("n", "[diff]d", ":lua diffview_open_current_file()<CR>", { noremap = false, silent = false, nowait = true })
vim.api.nvim_set_keymap("n", "[diff]h", ":DiffviewFileHistory %<CR>", { noremap = false, silent = false, nowait = true })
