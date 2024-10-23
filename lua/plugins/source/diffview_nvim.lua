local cb = require'diffview.config'.diffview_callback
local actions = require("diffview.actions")

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
  },
  default_args = {    -- Default args prepended to the arg-list for the listed commands
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
  hooks = {},         -- See ':h diffview-config-hooks'
  keymaps = {
    disable_defaults = false,                   -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      -- [c ]c でjumpできる
      { "n", "[diff]e", actions.goto_file, {} },          -- Open the file in a new split in previous tabpage
      { "n", "[diff]s", actions.goto_file_split, {} },    -- Open the file in a new split
      { "n", "[diff]t", actions.goto_file_tab, {} },      -- Open the file in a new tabpage
      { "n", "[diff]f", actions.focus_files, {} },        -- Bring focus to the files panel
      { "n", "[diff]b", actions.toggle_files, {} },       -- Toggle the files panel.
      { "n", "[diff]j", actions.select_next_entry, {} },           -- Bring the cursor to the next file entry
      { "n", "[diff]k", actions.select_prev_entry, {} },
    },
    file_panel = {
      { "n", "j", actions.next_entry, {} },           -- Bring the cursor to the next file entry
      { "n", "<down>", actions.next_entry, {} },
      { "n", "k", actions.prev_entry, {} },           -- Bring the cursor to the previous file entry.
      { "n", "<up>", actions.prev_entry, {} },
      { "n", "<cr>", actions.select_entry, {} },         -- Open the diff for the selected entry.
      { "n", "o", actions.select_entry, {} },
      { "n", "-", actions.toggle_stage_entry, {} },   -- Stage / unstage the selected entry.
      { "n", "S", actions.stage_all, {} },            -- Stage all entries.
      { "n", "U", actions.unstage_all, {} },          -- Unstage all entries.
      { "n", "X", actions.restore_entry, {} },        -- Restore entry to the state on the left side.
      { "n", "R", actions.refresh_files, {} },        -- Update stats and entries in the file list.
      { "n", "e", actions.goto_file, {} },
      { "n", "s", actions.goto_file_split, {} },
      { "n", "t", actions.goto_file_tab, {} },
      { "n", "i", actions.listing_style, {} },        -- Toggle between 'list' and 'tree' views
      { "n", "f", actions.toggle_flatten_dirs, {} },  -- Flatten empty subdirectories in tree listing style.
    },
    file_history_panel = {
      { "n", "g?", actions.options, {} },            -- Open the option panel
      { "n", "<C-A-d>", actions.open_in_diffview, {} },   -- Open the entry under the cursor in a diffview
      { "n", "y", actions.copy_hash, {} },          -- Copy the commit hash of the entry under the cursor
      { "n", "zR", actions.open_all_folds, {} },
      { "n", "zM", actions.close_all_folds, {} },
      { "n", "j", actions.next_entry, {} },
      { "n", "<down>", actions.next_entry, {} },
      { "n", "k", actions.prev_entry, {} },
      { "n", "<up>", actions.prev_entry, {} },
      { "n", "<cr>", actions.select_entry, {} },
      { "n", "o", actions.select_entry, {} },
      { "n", "e", actions.goto_file, {} },
      { "n", "s", actions.goto_file_split, {} },
      { "n", "t", actions.goto_file_tab, {} },
    },
    -- option_panel = {
    --   { "n", "<tab>", actions.select, {} },
    --   { "n", "q", actions.close, {} },
    -- },
  },
}

function _G.diffview_open_current_file()
  vim.cmd(":DiffviewOpen -- " .. vim.fn.expand("%"))
  return
end
function _G.diffview_open_current_file_from_revision(revision)
  vim.cmd(":DiffviewOpen "..revision.args.." -- " .. vim.fn.expand("%"))
  return
end


vim.api.nvim_set_keymap("n", "[diff]d", ":lua diffview_open_current_file()<CR>", { noremap = false, silent = false, nowait = true })
vim.api.nvim_set_keymap("n", "[diff]b", ":DiffviewOpen", { noremap = false, silent = false, nowait = true })
vim.api.nvim_set_keymap("n", "[diff]D", ":DiffviewOpenCurrentFileFromRevision", { noremap = false, silent = false, nowait = true })
vim.api.nvim_create_user_command(
  'DiffviewOpenCurrentFileFromRevision',
  function(revision)
    vim.cmd(":DiffviewOpen "..revision.args.." -- " .. vim.fn.expand("%"))
    return
  end,
  { nargs = 1 }
)
vim.api.nvim_set_keymap("n", "[diff]h", ":DiffviewFileHistory % --no-merges<CR>", { noremap = false, silent = false, nowait = true })
vim.api.nvim_set_keymap("n", "[diff]H", ":DiffviewFileHistory %<CR>", { noremap = false, silent = false, nowait = true })

vim.cmd("hi! DiffviewFilePanelSelected guifg=#DCA561")
