local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local list = {
  { key = {"<CR>", "e", "o"},      cb = tree_cb("edit") },
  { key = "l",                     cb = tree_cb("cd") },
  { key = "h",                     cb = tree_cb("parent_node")..tree_cb("edit") },
  { key = "v",                     cb = tree_cb("vsplit") },
  { key = "s",                     cb = tree_cb("split") },
  { key = "t",                     cb = tree_cb("tabnew") },
  { key = "<Tab>",                 cb = tree_cb("preview") },
  { key = "I",                     cb = tree_cb("toggle_ignored") },
  { key = ".",                     cb = tree_cb("toggle_dotfiles") },
  { key = "R",                     cb = tree_cb("refresh") },
  { key = "a",                     cb = tree_cb("create") },
  { key = "d",                     cb = tree_cb("remove") },
  { key = "r",                     cb = tree_cb("rename") },
  { key = "<C-r>",                 cb = tree_cb("full_rename") },
  { key = "m",                     cb = tree_cb("cut") },
  { key = "c",                     cb = tree_cb("copy") },
  { key = "p",                     cb = tree_cb("paste") },
  { key = "y",                     cb = tree_cb("copy_name") },
  { key = "Y",                     cb = tree_cb("copy_path") },
  { key = "gy",                    cb = tree_cb("copy_absolute_path") },
  { key = {"q", "<C-q>", "<C-[>"}, cb = tree_cb("close") },
  { key = "?",                     cb = tree_cb("toggle_help") },
}

local function open_with_path_command(dir)
  return ":lua require'nvim-tree.lib'.change_dir(" .. dir .."); require'nvim-tree'.open()<CR>"
end

vim.api.nvim_set_keymap("n", "[filer]d", open_with_path_command("vim.fn.FindGitProjectRoot()"), { noremap = false, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "[filer]b", open_with_path_command("vim.fn.expand('%:p:h')"), { noremap = false, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "[filer]h", open_with_path_command("vim.env.HOME"), { noremap = false, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "[filer]v", open_with_path_command("vim.env.XDG_CONFIG_HOME"), { noremap = false, silent = true, nowait = true })

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 100,
    hide_root_folder = false,
    side = 'right',
    auto_resize = false,
    mappings = {
      custom_only = true,
      list = list
    }
  }
}
