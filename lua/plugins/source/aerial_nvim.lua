require("aerial").setup({
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
  layout = {
    default_direction = "prefer_left",
    min_width = 20
  },
  keymaps = {
    ["?"] = "actions.show_help",
    ["g?"] = "actions.show_help",

    ["<CR>"] = "actions.jump",
    ["<C-v>"] = "actions.jump_vsplit",
    ["<C-s>"] = "actions.jump_split",
    ["p"] = "actions.scroll",
    ["<C-j>"] = "actions.down_and_scroll",
    ["<C-k>"] = "actions.up_and_scroll",
    ["{"] = "actions.prev",
    ["}"] = "actions.next",
    -- ["[["] = "actions.prev_up",
    -- ["]]"] = "actions.next_up",

    ["q"] = "actions.close",

    ["t"] = "actions.tree_toggle",
    ["T"] = "actions.tree_toggle_recursive",
    ["O"] = "actions.tree_open_all",
    ["C"] = "actions.tree_close_all",

    ["l"] = "actions.tree_open",
    ["L"] = "actions.tree_open_recursive",
    ["h"] = "actions.tree_close",
    ["H"] = "actions.tree_close_recursive",

    -- ["zr"] = "actions.tree_increase_fold_level",
    -- ["zm"] = "actions.tree_decrease_fold_level",
    ["zx"] = "actions.tree_sync_folds",
    ["zX"] = "actions.tree_sync_folds",
  },
  -- When you fold code with za, zo, or zc, update the aerial tree as well.
  -- Only works when manage_folds = true
  link_folds_to_tree = false,

  -- Fold code when you open/collapse symbols in the tree.
  -- Only works when manage_folds = true
  link_tree_to_folds = false,
})
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
