vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
  local function split(s, delimiter)
    local result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
      table.insert(result, match);
    end
    return result;
  end

  local function use_with_file(repo, ...)
    local a = { ... }
    local args = { repo }
    local plugin_name = split(repo, "/")[2]

    -- 最後の仮引数がtableの場合はそれをマージする
    if type(a[#a]) == "table" then
      for k, v in pairs(a[#a]) do
        args[k] = v
      end
      table.remove(a)
    end

    for i = 1 , #a do
      if a[i] == "add" then
        args["setup"] = loadstring("vim.cmd('so $XDG_CONFIG_HOME/plugins/add/" .. plugin_name .. ".rc.vim')")
      elseif a[i] == "add_lua" then
        plugin_name = string.gsub(plugin_name, "[.]", "_")
        args["setup"] = loadstring("require('plugins.add." .. plugin_name .. "')")
      elseif a[i] == "source" then
        args["config"] = loadstring("vim.cmd('so $XDG_CONFIG_HOME/plugins/source/" .. plugin_name .. ".rc.vim')")
      elseif a[i] == "source_lua" then
        plugin_name = string.gsub(plugin_name, "[.]", "_")
        args["config"] = loadstring("require('plugins.source." .. plugin_name .. "')")
      end
    end

    use(args)
  end

  use {
    { 'rytkmt/lighthouse' },
    { 'kana/vim-textobj-user' },
    { 'vim-jp/vimdoc-ja' },
    { 'kana/vim-operator-user' },
    { 'tyru/stoptypofile.vim' },
    { 'tpope/vim-repeat' },
    { 'lewis6991/impatient.nvim' },
    { 'itchyny/vim-qfedit' },
  }
  use_with_file("kana/vim-submode", "add")
  use_with_file("thinca/vim-quickrun", "add", { requires = { "lambdalisue/vim-quickrun-neovim-job" } })
  -- use_with_file("airblade/vim-gitgutter", "add")
  use_with_file("junegunn/vim-easy-align", "add")
  use_with_file("rytkmt/indent-blank-guides.nvim", "source_lua")
  -- use_with_file("vim-scripts/grep.vim", "add")
  use_with_file("tomtom/tcomment_vim", "add")
  -- use_with_file("tpope/vim-surround", "add")
  -- use_with_file("ur4ltz/surround.nvim", "source_lua")
  use_with_file("kylechui/nvim-surround", "source_lua")
  use_with_file("nacro90/numb.nvim", "source_lua")
  use_with_file("LeafCage/yankround.vim", "add")
  use_with_file("osyo-manga/vim-anzu", "add")
  -- use_with_file("rhysd/clever-f.vim", "add")
  -- 遅いため一回消す
  -- use_with_file("haya14busa/vim-operator-flashy", "add")
  use_with_file("kana/vim-operator-replace", "add")
  -- use_with_file("rytkmt/vim-trailing-whitespace", "add")
  -- 遅いので一時的にコメントアウトしておく
  -- use_with_file("vim-syntastic/syntastic", "add")

  use_with_file("haya14busa/vim-edgemotion", "source")
  use_with_file("skanehira/qfopen.vim", "source")
  use_with_file("nvim-treesitter/nvim-treesitter", "source_lua", {
    -- run = ':TSUpdate',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
    requires = 'nvim-treesitter/playground'
  })
  use_with_file("haya14busa/vim-asterisk", "source")
  use_with_file("nathom/filetype.nvim", "source_lua")
  use_with_file("bbjornstad/pretty-fold.nvim", "source_lua")
  -- use_with_file("monkoose/matchparen.nvim", "source_lua")
  use_with_file("AndrewRadev/switch.vim", "add", "source")
  use_with_file("Pocco81/HighStr.nvim", "source_lua")
  -- use_with_file("tkmpypy/chowcho.nvim", "source_lua")
  -- use_with_file("Shougo/vimproc.vim", "add", "source")
  use_with_file('rytkmt/tabline.nvim', "source_lua", { branch = 'develop', requires = {'kyazdani42/nvim-web-devicons'} })
  use_with_file('nvim-lualine/lualine.nvim', "source_lua", { requires = 'kyazdani42/nvim-web-devicons' })
  use_with_file('SmiteshP/nvim-navic', "source_lua")
  use_with_file('tamago324/lir.nvim', "source_lua", { requires = { { 'kyazdani42/nvim-web-devicons' }, { 'nvim-lua/plenary.nvim' } } })
  use_with_file('tamago324/lir-git-status.nvim', "source_lua", { requires = { { 'tamago324/lir-git-status.nvim' } } })
  use_with_file('lewis6991/gitsigns.nvim', "source_lua")
  use_with_file('sindrets/diffview.nvim', "source_lua", { requires = 'nvim-lua/plenary.nvim' })
  -- use_with_file("windwp/nvim-autopairs", "source_lua", { requires = { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } })
  use_with_file("windwp/nvim-autopairs", "source_lua", { requires = 'nvim-treesitter/nvim-treesitter' })
  -- 遅いため一旦・・
  -- use_with_file('gelguy/wilder.nvim', "source")
  -- use { 'cohama/lexima.vim', setup = function() vim.g.lexima_accept_pum_with_enter = 0 end }
  use_with_file("rlane/pounce.nvim", "source_lua")
  use_with_file("phaazon/hop.nvim", "source_lua")
  use_with_file("chentoast/marks.nvim", "source_lua")
  use_with_file("andymass/vim-matchup", "add_lua")
  use_with_file(
    'nvim-telescope/telescope.nvim',
    "source_lua",
    {
      requires = {
        'nvim-lua/plenary.nvim',
        'sam4llis/telescope-arglist.nvim'
      }
    }
  )
  use_with_file('mattn/vim-sqlfmt', "add", { opt = true, ft = "sql" })
  use_with_file('uga-rosa/translate.nvim', "source_lua")

  use_with_file("rhysd/conflict-marker.vim", "source")
  use_with_file("cuducos/yaml.nvim", "source_lua", { ft = { "yaml" }, requires = { "nvim-treesitter/nvim-treesitter", "nvim-telescope/telescope.nvim" } })
  use_with_file(
    'mfussenegger/nvim-lint',
    'source_lua',
    { ft = { "ruby", "lua" } }
  )
  use_with_file(
    'petertriho/nvim-scrollbar',
    'source_lua'
  )
  use_with_file("ysmb-wtsg/in-and-out.nvim", "source_lua")

  -- 遅延系

  use {
    'tyru/capture.vim',
    opt = true,
    cmd = { 'Capture' }
  }

  use {
    'cocopon/inspecthi.vim',
    -- opt = true,
    -- cmd = { 'Inspecthi', 'InspecthiShowInspector', 'InspecthiHideInspector' }
  }

  -- use { 'kana/vim-smartinput', opt = true, event = "InsertEnter *" }
  -- use_with_file("cohama/vim-smartinput-endwise", "source", { opt = true, event = "InsertEnter *" })

  -- markdown
  local markdown_option = { opt = true, ft = { "markdown", "mkd" } }
  use_with_file("rcmdnk/vim-markdown", "add", markdown_option)
  use("joker1007/vim-markdown-quote-syntax", markdown_option)
  use("mattn/vim-maketable", markdown_option)
  use_with_file("dhruvasagar/vim-table-mode", "add", markdown_option)
  use_with_file("richardbizik/nvim-toc", "source_lua", markdown_option)
  local options = markdown_option
  -- options.run = "cd app && npm install"
  options.run = function() vim.fn["mkdp#util#install"]() end
  use_with_file("iamcco/markdown-preview.nvim", "add", options)
  use({
    'MeanderingProgrammer/render-markdown.nvim',
    after = { 'nvim-treesitter' },
    requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
    -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
    -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
    config = function()
      require('render-markdown').setup({})
    end,
  })

  -- textile
  -- use { "rytkmt/vim-textile", opt = true, ft = "textile" }

  -- ruby
  -- use_with_file("rytkmt/vim-textobj-ruby", "add", "source", { opt = true, ft = "ruby", branch = "feature_textobj_ruby_method" })
  -- use_with_file("rhysd/vim-textobj-ruby", { opt = true, ft = "ruby", after = "vim-textobj-user" })
  -- use { "nvim-treesitter/nvim-treesitter-textobjects" }

  use { 'vim-scripts/AnsiEsc.vim', opt = true, ft = { "log" } }
  -- vim
  -- use { "thinca/vim-prettyprint", opt = true, ft = "vim" }

  -- lua, vim
  use { "norcalli/nvim-colorizer.lua", opt = true, ft = { "vim", "lua", "zsh", "markdown" } }--, config = function() require'colorizer'.setup() end }

  -- ddc周り
  use {
    'vim-denops/denops.vim',
    config = function() vim.call("denops#server#start") end,
    -- setup = function()
    --   -- vim.g.denops_server_addr = '127.0.0.1:32123'
    -- end
  }
  use_with_file("hrsh7th/vim-vsnip", "add")

  use_with_file(
    'hrsh7th/nvim-cmp',
    'source_lua',
    {
      requires = {
        {
          'hrsh7th/cmp-nvim-lsp',
          requires = 'neovim/nvim-lspconfig'
        },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'uga-rosa/cmp-dictionary' },
        { 'hrsh7th/cmp-cmdline' },
        {
          'hrsh7th/cmp-vsnip',
          requires = 'hrsh7th/vim-vsnip'
        }
      }
    }
  )
  use {'kevinhwang91/nvim-bqf', ft = 'qf'}
  -- lazy.nvim
end)
