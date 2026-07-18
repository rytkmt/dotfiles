local function spec_with_file(repo, ...)
  local a = { ... }
  local spec = { repo }
  local plugin_name = repo:match("/(.+)$")

  if type(a[#a]) == "table" then
    for k, v in pairs(a[#a]) do
      spec[k] = v
    end
    table.remove(a)
  end

  local init_fn = nil
  local config_fn = nil

  for _, kind in ipairs(a) do
    if kind == "add" then
      init_fn = function()
        vim.cmd('so $XDG_CONFIG_HOME/plugins/add/' .. plugin_name .. '.rc.vim')
      end
    elseif kind == "add_lua" then
      local mod_name = plugin_name:gsub("[.]", "_")
      init_fn = function()
        require('plugins.add.' .. mod_name)
      end
    elseif kind == "source" then
      config_fn = function()
        vim.cmd('so $XDG_CONFIG_HOME/plugins/source/' .. plugin_name .. '.rc.vim')
      end
    elseif kind == "source_lua" then
      local mod_name = plugin_name:gsub("[.]", "_")
      config_fn = function()
        require('plugins.source.' .. mod_name)
      end
    end
  end

  if init_fn then spec.init = init_fn end
  if config_fn then spec.config = config_fn end

  return spec
end

return {
  { "rytkmt/lighthouse" },
  { "kana/vim-textobj-user" },
  { "kana/vim-operator-user" },
  { "tyru/stoptypofile.vim" },
  { "tpope/vim-repeat" },
  { "itchyny/vim-qfedit" },

  spec_with_file("kana/vim-submode", "add"),
  spec_with_file("thinca/vim-quickrun", "add", {
    dependencies = { "lambdalisue/vim-quickrun-neovim-job" },
  }),
  spec_with_file("junegunn/vim-easy-align", "add"),
  spec_with_file("tomtom/tcomment_vim", "add"),
  spec_with_file("LeafCage/yankround.vim", "add"),
  spec_with_file("osyo-manga/vim-anzu", "add"),
  spec_with_file("kana/vim-operator-replace", "add", {
    dependencies = { "kana/vim-operator-user" },
  }),
  spec_with_file("jgdavey/vim-blockle", "add"),
  spec_with_file("hrsh7th/vim-vsnip", "add"),

  spec_with_file("andymass/vim-matchup", "add_lua"),

  spec_with_file("haya14busa/vim-edgemotion", "source"),
  spec_with_file("skanehira/qfopen.vim", "source"),
  spec_with_file("haya14busa/vim-asterisk", "source"),
  spec_with_file("rhysd/conflict-marker.vim", "source"),

  spec_with_file("rytkmt/indent-blank-guides.nvim", "source_lua"),
  spec_with_file("folke/todo-comments.nvim", "source_lua", {
    dependencies = { "nvim-lua/plenary.nvim" },
  }),
  spec_with_file("kylechui/nvim-surround", "source_lua"),
  spec_with_file("nacro90/numb.nvim", "source_lua"),
  spec_with_file("nvim-treesitter/nvim-treesitter", "source_lua", {
    build = ":TSUpdate",
  }),
  { "RRethy/nvim-treesitter-endwise", dependencies = { "nvim-treesitter/nvim-treesitter" } },
  spec_with_file("nathom/filetype.nvim", "source_lua"),
  spec_with_file("bbjornstad/pretty-fold.nvim", "source_lua"),
  spec_with_file("Pocco81/HighStr.nvim", "source_lua"),
  spec_with_file("tkmpypy/chowcho.nvim", "source_lua"),
  spec_with_file("rytkmt/tabline.nvim", "source_lua", {
    branch = "develop",
    dependencies = { "kyazdani42/nvim-web-devicons" },
  }),
  spec_with_file("nvim-lualine/lualine.nvim", "source_lua", {
    dependencies = { "kyazdani42/nvim-web-devicons" },
  }),
  spec_with_file("SmiteshP/nvim-navic", "source_lua"),
  spec_with_file("tamago324/lir.nvim", "source_lua", {
    dependencies = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" },
  }),
  spec_with_file("tamago324/lir-git-status.nvim", "source_lua", {
    dependencies = { "tamago324/lir.nvim" },
  }),
  spec_with_file("lewis6991/gitsigns.nvim", "source_lua"),
  spec_with_file("sindrets/diffview.nvim", "source_lua", {
    dependencies = { "nvim-lua/plenary.nvim" },
  }),
  spec_with_file("windwp/nvim-autopairs", "source_lua", {
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  }),
  spec_with_file("rlane/pounce.nvim", "source_lua"),
  spec_with_file("chentoast/marks.nvim", "source_lua"),
  spec_with_file("nvim-telescope/telescope.nvim", "source_lua", {
    dependencies = { "nvim-lua/plenary.nvim", "sam4llis/telescope-arglist.nvim" },
  }),
  spec_with_file("uga-rosa/translate.nvim", "source_lua"),
  spec_with_file("stevearc/aerial.nvim", "source_lua"),
  spec_with_file("folke/snacks.nvim", "source_lua"),
  spec_with_file("coder/claudecode.nvim", "source_lua", {
    dependencies = { "folke/snacks.nvim", "nvim-lua/plenary.nvim" },
  }),
  spec_with_file("petertriho/nvim-scrollbar", "source_lua"),
  spec_with_file("ysmb-wtsg/in-and-out.nvim", "source_lua"),
  spec_with_file("rytkmt/tempaste.nvim", "source_lua"),
  spec_with_file("j-hui/fidget.nvim", "source_lua"),
  spec_with_file("fei6409/log-highlight.nvim", "source_lua"),
  spec_with_file("Wansmer/treesj", "source_lua", {
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  }),

  spec_with_file("AndrewRadev/switch.vim", "add", "source"),

  spec_with_file("mattn/vim-sqlfmt", "add", { ft = "sql" }),
  spec_with_file("cuducos/yaml.nvim", "source_lua", {
    ft = { "yaml" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim" },
  }),
  spec_with_file("mfussenegger/nvim-lint", "source_lua", { ft = { "ruby", "lua" } }),
  spec_with_file("hat0uma/csvview.nvim", "source_lua", { ft = "csv" }),
  spec_with_file("Makaze/AnsiEsc", "add", { ft = { "log" } }),
  { "norcalli/nvim-colorizer.lua", ft = { "vim", "lua", "zsh", "markdown" } },

  { "tyru/capture.vim", cmd = { "Capture" } },

  { "cocopon/inspecthi.vim" },

  spec_with_file("rcmdnk/vim-markdown", "add", { ft = { "markdown", "mkd" } }),
  { "joker1007/vim-markdown-quote-syntax", ft = { "markdown", "mkd" } },
  { "mattn/vim-maketable", ft = { "markdown", "mkd" } },
  { "jghauser/follow-md-links.nvim", ft = { "markdown", "mkd" } },
  spec_with_file("dhruvasagar/vim-table-mode", "add", { ft = { "markdown", "mkd" } }),
  spec_with_file("richardbizik/nvim-toc", "source_lua", { ft = { "markdown", "mkd" } }),
  spec_with_file("Gowa2017/markdown-preview.nvim", "add", {
    build = "cd app && npm install",
  }),
  spec_with_file("MeanderingProgrammer/render-markdown.nvim", "source_lua", {
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      { "echasnovski/mini.nvim", optional = true },
    },
  }),

  {
    "vim-denops/denops.vim",
    lazy = false,
    config = function()
      vim.fn["denops#server#start"]()
    end,
  },

  spec_with_file("hrsh7th/nvim-cmp", "source_lua", {
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", dependencies = { "neovim/nvim-lspconfig" } },
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "davidmh/cmp-nerdfonts",
      "uga-rosa/cmp-dictionary",
      "hrsh7th/cmp-cmdline",
      { "hrsh7th/cmp-vsnip", dependencies = { "hrsh7th/vim-vsnip" } },
      "SmiteshP/nvim-navic",
    },
  }),

  { "kevinhwang91/nvim-bqf", ft = "qf" },
}