vim.cmd[[packadd packer.nvim]]
require'packer'.startup(function()
  local function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
      table.insert(result, match);
    end
    return result;
  end

  local function eval(inStr)
    return assert(load(inStr))()
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
      elseif a[i] == "source" then
        args["config"] = loadstring("vim.cmd('so $XDG_CONFIG_HOME/plugins/source/" .. plugin_name .. ".rc.vim')")
      elseif a[i] == "source_lua" then
        plugin_name = string.gsub(plugin_name, "[.]", "_")
        args["config"] = loadstring("require('plugins." .. plugin_name .. "')")
      end
    end

    use(args)
  end

  use {
    { 'rytkmt/lighthouse' },
    { 'kana/vim-textobj-user' },
    { 'vim-scripts/AnsiEsc.vim' },
    { 'vim-jp/vimdoc-ja' },
    { 'kana/vim-operator-user' },
    { 'tyru/stoptypofile.vim' }
  }
  use_with_file("kana/vim-submode", "add")
  use_with_file("thinca/vim-quickrun", "add", { requires = { "lambdalisue/vim-quickrun-neovim-job" } })
  -- use_with_file("airblade/vim-gitgutter", "add")
  use_with_file("junegunn/vim-easy-align", "add")
  use_with_file("glepnir/indent-guides.nvim", "source_lua")
  use_with_file("vim-scripts/grep.vim", "add")
  use_with_file("tomtom/tcomment_vim", "add")
  -- use_with_file("tpope/vim-surround", "add")
  use_with_file("ur4ltz/surround.nvim", "source_lua")
  use_with_file("LeafCage/yankround.vim", "add")
  use_with_file("osyo-manga/vim-anzu", "add")
  -- use_with_file("rhysd/clever-f.vim", "add")
  -- 遅いため一回消す
  -- use_with_file("haya14busa/vim-operator-flashy", "add")
  use_with_file("kana/vim-operator-replace", "add")
  -- use_with_file("rytkmt/vim-trailing-whitespace", "add")
  -- 遅いので一時的にコメントアウトしておく
  -- use_with_file("vim-syntastic/syntastic", "add")

  use_with_file("haya14busa/vim-asterisk", "source")
  use_with_file("nathom/filetype.nvim", "source_lua")
  use_with_file("monkoose/matchparen.nvim", "source_lua")
  use_with_file("AndrewRadev/switch.vim", "add", "source")
  use_with_file("Pocco81/HighStr.nvim", "source_lua")
  -- use_with_file("Shougo/vimproc.vim", "add", "source")
  use_with_file('rytkmt/tabline.nvim', "source_lua", { branch = 'develop', requires = {'kyazdani42/nvim-web-devicons'} })
  use_with_file('nvim-lualine/lualine.nvim', "source_lua", { requires = 'kyazdani42/nvim-web-devicons' })
  use_with_file('tamago324/lir.nvim', "source_lua", { requires = { { 'kyazdani42/nvim-web-devicons' }, { 'nvim-lua/plenary.nvim' } } })
  use_with_file('lewis6991/gitsigns.nvim', "source_lua")
  use_with_file('sindrets/diffview.nvim', "source_lua", { requires = 'nvim-lua/plenary.nvim' })
  use_with_file("windwp/nvim-autopairs", "source_lua", { requires = { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } })
  -- 遅いため一旦・・
  -- use_with_file('gelguy/wilder.nvim', "source")
  -- use { 'cohama/lexima.vim', setup = function() vim.g.lexima_accept_pum_with_enter = 0 end }
  use_with_file('rlane/pounce.nvim', "source_lua")
  use_with_file(
    'nvim-telescope/telescope.nvim',
    "source_lua",
    { requires = { {'nvim-lua/plenary.nvim'} } }
  )
  use_with_file('mattn/vim-sqlfmt', "add", { opt = true, ft = "sql" })

  -- 遅延系

  use {
    'tyru/capture.vim',
    opt = true,
    cmd = { 'Capture' }
  }


  -- use {
  --   'cocopon/inspecthi.vim',
  --   opt = true,
  --   cmd = { 'Inspecthi', 'InspecthiShowInspector', 'InspecthiHideInspector' }
  -- }

  -- use { 'kana/vim-smartinput', opt = true, event = "InsertEnter *" }
  -- use_with_file("cohama/vim-smartinput-endwise", "source", { opt = true, event = "InsertEnter *" })

  -- markdown
  use_with_file("rcmdnk/vim-markdown", "add", { opt = true, ft = { "markdown", "mkd" } })
  use { "joker1007/vim-markdown-quote-syntax", opt = true, ft = { "markdown", "mkd" } }
  use("ellisonleao/glow.nvim", { opt = true, ft = { "markdown", "mkd" }})
  use { "mattn/vim-maketable", opt = true, ft = { "markdown", "mkd" } }

  -- textile
  use { "rytkmt/vim-textile", opt = true, ft = "textile" }

  -- ruby
  use_with_file("rytkmt/vim-textobj-ruby", "add", "source", { opt = true, ft = "ruby", branch = "feature_textobj_ruby_method" })

  -- vim
  use { "thinca/vim-prettyprint", opt = true, ft = "vim" }

  -- lua, vim
  use { "norcalli/nvim-colorizer.lua", opt = true, ft = { "vim", "lua" } }--, config = function() require'colorizer'.setup() end }

  -- ddc周り
  use {
    'vim-denops/denops.vim',
    opt = true,
    ft = { 'git', 'snippet', 'toml', 'vim', 'ruby' },
    config = function() vim.call("denops#server#start") end,
  }

  use_with_file("hrsh7th/vim-vsnip", "add", { requires = { 'rafamadriz/friendly-snippets' } })

  use {
    'Shougo/ddc.vim',
    requires = {
      {
        'Shougo/ddc-nvim-lsp',
        requires = 'neovim/nvim-lspconfig'
      },
      { 'Shougo/ddc-matcher_head' },
      { 'Shougo/ddc-sorter_rank' },
      { 'tani/ddc-fuzzy' },
      { 'Shougo/ddc-around' },
      { 'hrsh7th/vim-vsnip-integ', after = 'vim-vsnip' },
      { 'matsui54/ddc-buffer' }
    },
    after = 'denops.vim',
    config = function()
      vim.cmd('so $XDG_CONFIG_HOME/plugins/source/ddc.vim.rc.vim')
    end
  }
end)
