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

    -- { 'rytkmt/dotfiles' },
  use {
    { 'rytkmt/lighthouse' },
    { 'kana/vim-textobj-user' },
    { 'vim-scripts/AnsiEsc.vim' },
    { 'vim-jp/vimdoc-ja' },
    { 'kana/vim-operator-user' },
    { 'tyru/stoptypofile.vim' },
    { 'neovim/nvim-lspconfig' }
  }

  use_with_file("kana/vim-submode", "add")
  use_with_file("thinca/vim-quickrun", "add")
  use_with_file("airblade/vim-gitgutter", "add")
  use_with_file("junegunn/vim-easy-align", "add")
  use_with_file("nathanaelkane/vim-indent-guides", "add")
  use_with_file("vim-scripts/grep.vim", "add")
  use_with_file("tomtom/tcomment_vim", "add")
  use_with_file("tpope/vim-surround", "add")
  use_with_file("ctrlpvim/ctrlp.vim", "add")
  use_with_file("LeafCage/yankround.vim", "add")
  use_with_file("osyo-manga/vim-anzu", "add")
  use_with_file("rhysd/clever-f.vim", "add")
  use_with_file("haya14busa/vim-operator-flashy", "add")
  use_with_file("kana/vim-operator-replace", "add")
  use_with_file("airblade/vim-rooter", "add")
  use_with_file("SirVer/ultisnips", "add", "source")
  -- use_with_file("rytkmt/vim-trailing-whitespace", "add")
  -- 遅いので一時的にコメントアウトしておく
  -- use_with_file("lilydjwg/colorizer", "add")
  -- use_with_file("vim-syntastic/syntastic", "add")

  use_with_file("itchyny/lightline.vim", "source")
  use_with_file("haya14busa/vim-asterisk", "source")
  use_with_file("nathom/filetype.nvim", "source_lua")
  use_with_file("AndrewRadev/switch.vim", "add", "source")
  -- use_with_file("Shougo/vimproc.vim", "add", "source")

  use { 'cohama/lexima.vim', setup = function() vim.g.lexima_accept_pum_with_enter = 0 end }

  -- 遅延系

  use {
    'tyru/capture.vim',
    opt = true,
    cmd = { 'Capture' }
  }

  use {
    'cocopon/inspecthi.vim',
    opt = true,
    cmd = { 'Inspecthi', 'InspecthiShowInspector', 'InspecthiHideInspector' }
  }

  use { 'kana/vim-smartinput', opt = true, event = "InsertEnter *" }
  use_with_file("cohama/vim-smartinput-endwise", "source", { opt = true, event = "InsertEnter *" })

  -- markdown
  use_with_file("rcmdnk/vim-markdown", "add", { opt = true, ft = { "markdown", "mkd" } })
  use { "joker1007/vim-markdown-quote-syntax", opt = true, ft = { "markdown", "mkd" } }
  use { "mattn/vim-maketable", opt = true, ft = { "markdown", "mkd" } }

  -- textile
  use { "rytkmt/vim-textile", opt = true, ft = "textile" }

  -- vim
  use { "thinca/vim-prettyprint", opt = true, ft = "vim" }

  -- use { "vim-denops/denops.vim", opt = true, fn = 'denops#server#start', config = function() vim.call("denops#server#start()") end }
end)
