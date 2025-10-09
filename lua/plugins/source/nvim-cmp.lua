local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered({border = 'single'}),
    documentation = cmp.config.disable,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-s>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<C-t>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'vsnip', priority = 1 }, -- For vsnip users.
    { name = 'nvim_lsp', priority = 2 },
    {
      name = 'buffer',
      priority = 3,
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end
      }
    },
    {
      name = "dictionary",
      keyword_length = 2,
      priority = 4
    },
    { name = 'path', priority = 5 },
  })
})
cmp.setup.filetype({ 'lua' }, {
  sources = cmp.config.sources({
    { name = 'vsnip', priority = 1 }, -- For vsnip users.
    { name = 'nvim_lsp', priority = 2 },
    {
      name = 'buffer',
      priority = 3,
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end
      }
    },
    {
      name = "dictionary",
      keyword_length = 2,
      priority = 4
    },
    { name = 'path', priority = 5 },
    { name = 'emoji', priority = 6 },
    { name = 'nerdfonts', priority = 7 }
  })
})

cmp.setup.filetype({ 'markdown' }, {
  sources = cmp.config.sources({
    { name = 'vsnip', priority = 1 }, -- For vsnip users.
    { name = 'nvim_lsp', priority = 2 },
    {
      name = 'buffer',
      priority = 3,
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end
      }
    },
    {
      name = "dictionary",
      keyword_length = 2,
      priority = 4
    },
    { name = 'path', priority = 5 },
    { name = 'emoji', priority = 6 },
  })
})


local dicts_hash = {}
local dicts_dir = os.getenv('XDG_CONFIG_HOME')..'/dicts'
if vim.fn.isdirectory(dicts_dir) then
  for _,ft in ipairs(vim.fn.readdir(dicts_dir)) do
    dicts_hash[ft] = vim.fn.globpath('$XDG_CONFIG_HOME/dicts/'..ft..'/', '*', true, true)
  end
end

local function select_dicts()
  local dicts = dicts_hash["all"]
  local ft_dicts = dicts_hash[vim.bo.filetype]
  if ft_dicts then
    vim.list_extend(dicts, ft_dicts)
  end
  return dicts
end
local function cache_dicts()
  if not vim.b.dict then
    vim.b.dict = select_dicts()
  end
  return vim.b.dict
end
local function cache_or_select_dicts()
  return vim.b.dict or select_dicts()
end

require("cmp_dictionary").setup({
  paths = select_dicts(),
  exact_length = 2,
  first_case_insensitive = true,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(_)
    require("cmp_dictionary").setup({
      paths = cache_dicts(),
    })
    if pcall(vim.api.nvim_buf_get_var, 0, 'navic_enabled') then
      vim.wo.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end
  end
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function(_)
    require("cmp_dictionary").setup({
      paths = cache_or_select_dicts(),
    })
    if pcall(vim.api.nvim_buf_get_var, 0, 'navic_enabled') then
      vim.wo.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end
  end
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline({
    ["<C-N>"] = function() end,
    ["<C-P>"] = function() end,
  }),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline({
    ["<C-N>"] = function() end,
    ["<C-P>"] = function() end,
  }),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

vim.api.nvim_set_keymap("n", "[lsp]i", "<plug>(lsp-type-hierarchy)", { noremap = true, nowait = true, silent = true })
vim.api.nvim_set_keymap("n", "[lsp]h", "<plug>(lsp-hover)", { noremap = true, nowait = true, silent = true })
