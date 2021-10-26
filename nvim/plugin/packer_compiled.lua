-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/vagrant/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/vagrant/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/vagrant/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/vagrant/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/vagrant/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["AnsiEsc.vim"] = {
    loaded = true,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/start/AnsiEsc.vim"
  },
  ["capture.vim"] = {
    commands = { "Capture" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/capture.vim"
  },
  ["clever-f.vim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/clever-f.vim"
  },
  ["ctrlp.vim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/ctrlp.vim"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\2\n5\2\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.filetype_nvim\frequire\0" },
    loaded = true,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/start/filetype.nvim"
  },
  ["grep.vim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/grep.vim"
  },
  ["inspecthi.vim"] = {
    commands = { "Inspecthi", "InspecthiShowInspector", "InspecthiHideInspector" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/inspecthi.vim"
  },
  ["lexima.vim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/lexima.vim"
  },
  lighthouse = {
    loaded = true,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/start/lighthouse"
  },
  ["lightline.vim"] = {
    config = { "\27LJ\2\n[\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0<so $XDG_CONFIG_HOME/plugins/source/lightline.vim.rc.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["stoptypofile.vim"] = {
    loaded = true,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/start/stoptypofile.vim"
  },
  ["switch.vim"] = {
    config = { "\27LJ\2\nX\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0009so $XDG_CONFIG_HOME/plugins/source/switch.vim.rc.vim\bcmd\bvim\0" },
    loaded = true,
    needs_bufread = true,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/switch.vim"
  },
  tcomment_vim = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/tcomment_vim"
  },
  ultisnips = {
    after_files = { "/home/vagrant/.local/share/nvim/site/pack/packer/opt/ultisnips/after/plugin/UltiSnips_after.vim" },
    loaded = true,
    needs_bufread = true,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/ultisnips"
  },
  ["vim-anzu"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-anzu"
  },
  ["vim-asterisk"] = {
    config = { "\27LJ\2\nZ\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0;so $XDG_CONFIG_HOME/plugins/source/vim-asterisk.rc.vim\bcmd\bvim\0" },
    loaded = true,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/start/vim-asterisk"
  },
  ["vim-easy-align"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-easy-align"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-gitgutter"
  },
  ["vim-indent-guides"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-indent-guides"
  },
  ["vim-maketable"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-maketable"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-markdown-quote-syntax"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-markdown-quote-syntax"
  },
  ["vim-operator-flashy"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-operator-flashy"
  },
  ["vim-operator-replace"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-operator-replace"
  },
  ["vim-operator-user"] = {
    loaded = true,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/start/vim-operator-user"
  },
  ["vim-prettyprint"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-prettyprint"
  },
  ["vim-quickrun"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-quickrun"
  },
  ["vim-rooter"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-rooter"
  },
  ["vim-smartinput"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-smartinput"
  },
  ["vim-smartinput-endwise"] = {
    config = { "\27LJ\2\nd\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Eso $XDG_CONFIG_HOME/plugins/source/vim-smartinput-endwise.rc.vim\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-smartinput-endwise"
  },
  ["vim-submode"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-submode"
  },
  ["vim-surround"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-surround"
  },
  ["vim-textile"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-textile"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vimdoc-ja"] = {
    loaded = true,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/start/vimdoc-ja"
  },
  ["yankround.vim"] = {
    after_files = { "/home/vagrant/.local/share/nvim/site/pack/packer/opt/yankround.vim/after/plugin/yankround.vim" },
    loaded = true,
    needs_bufread = false,
    path = "/home/vagrant/.local/share/nvim/site/pack/packer/opt/yankround.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: vim-easy-align
time([[Setup for vim-easy-align]], true)
try_loadstring("\27LJ\2\nY\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0:so $XDG_CONFIG_HOME/plugins/add/vim-easy-align.rc.vim\bcmd\bvim\0", "setup", "vim-easy-align")
time([[Setup for vim-easy-align]], false)
time([[packadd for vim-easy-align]], true)
vim.cmd [[packadd vim-easy-align]]
time([[packadd for vim-easy-align]], false)
-- Setup for: switch.vim
time([[Setup for switch.vim]], true)
try_loadstring("\27LJ\2\nU\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0006so $XDG_CONFIG_HOME/plugins/add/switch.vim.rc.vim\bcmd\bvim\0", "setup", "switch.vim")
time([[Setup for switch.vim]], false)
time([[packadd for switch.vim]], true)
vim.cmd [[packadd switch.vim]]
time([[packadd for switch.vim]], false)
-- Setup for: tcomment_vim
time([[Setup for tcomment_vim]], true)
try_loadstring("\27LJ\2\nW\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0008so $XDG_CONFIG_HOME/plugins/add/tcomment_vim.rc.vim\bcmd\bvim\0", "setup", "tcomment_vim")
time([[Setup for tcomment_vim]], false)
time([[packadd for tcomment_vim]], true)
vim.cmd [[packadd tcomment_vim]]
time([[packadd for tcomment_vim]], false)
-- Setup for: vim-operator-replace
time([[Setup for vim-operator-replace]], true)
try_loadstring("\27LJ\2\n_\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0@so $XDG_CONFIG_HOME/plugins/add/vim-operator-replace.rc.vim\bcmd\bvim\0", "setup", "vim-operator-replace")
time([[Setup for vim-operator-replace]], false)
time([[packadd for vim-operator-replace]], true)
vim.cmd [[packadd vim-operator-replace]]
time([[packadd for vim-operator-replace]], false)
-- Setup for: vim-indent-guides
time([[Setup for vim-indent-guides]], true)
try_loadstring("\27LJ\2\n\\\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0=so $XDG_CONFIG_HOME/plugins/add/vim-indent-guides.rc.vim\bcmd\bvim\0", "setup", "vim-indent-guides")
time([[Setup for vim-indent-guides]], false)
time([[packadd for vim-indent-guides]], true)
vim.cmd [[packadd vim-indent-guides]]
time([[packadd for vim-indent-guides]], false)
-- Setup for: vim-surround
time([[Setup for vim-surround]], true)
try_loadstring("\27LJ\2\nW\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0008so $XDG_CONFIG_HOME/plugins/add/vim-surround.rc.vim\bcmd\bvim\0", "setup", "vim-surround")
time([[Setup for vim-surround]], false)
time([[packadd for vim-surround]], true)
vim.cmd [[packadd vim-surround]]
time([[packadd for vim-surround]], false)
-- Setup for: vim-rooter
time([[Setup for vim-rooter]], true)
try_loadstring("\27LJ\2\nU\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0006so $XDG_CONFIG_HOME/plugins/add/vim-rooter.rc.vim\bcmd\bvim\0", "setup", "vim-rooter")
time([[Setup for vim-rooter]], false)
time([[packadd for vim-rooter]], true)
vim.cmd [[packadd vim-rooter]]
time([[packadd for vim-rooter]], false)
-- Setup for: ctrlp.vim
time([[Setup for ctrlp.vim]], true)
try_loadstring("\27LJ\2\nT\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0005so $XDG_CONFIG_HOME/plugins/add/ctrlp.vim.rc.vim\bcmd\bvim\0", "setup", "ctrlp.vim")
time([[Setup for ctrlp.vim]], false)
time([[packadd for ctrlp.vim]], true)
vim.cmd [[packadd ctrlp.vim]]
time([[packadd for ctrlp.vim]], false)
-- Setup for: ultisnips
time([[Setup for ultisnips]], true)
try_loadstring("\27LJ\2\nT\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0005so $XDG_CONFIG_HOME/plugins/add/ultisnips.rc.vim\bcmd\bvim\0", "setup", "ultisnips")
time([[Setup for ultisnips]], false)
time([[packadd for ultisnips]], true)
vim.cmd [[packadd ultisnips]]
time([[packadd for ultisnips]], false)
-- Setup for: vim-submode
time([[Setup for vim-submode]], true)
try_loadstring("\27LJ\2\nV\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0007so $XDG_CONFIG_HOME/plugins/add/vim-submode.rc.vim\bcmd\bvim\0", "setup", "vim-submode")
time([[Setup for vim-submode]], false)
time([[packadd for vim-submode]], true)
vim.cmd [[packadd vim-submode]]
time([[packadd for vim-submode]], false)
-- Setup for: vim-anzu
time([[Setup for vim-anzu]], true)
try_loadstring("\27LJ\2\nS\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0004so $XDG_CONFIG_HOME/plugins/add/vim-anzu.rc.vim\bcmd\bvim\0", "setup", "vim-anzu")
time([[Setup for vim-anzu]], false)
time([[packadd for vim-anzu]], true)
vim.cmd [[packadd vim-anzu]]
time([[packadd for vim-anzu]], false)
-- Setup for: vim-operator-flashy
time([[Setup for vim-operator-flashy]], true)
try_loadstring("\27LJ\2\n^\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0?so $XDG_CONFIG_HOME/plugins/add/vim-operator-flashy.rc.vim\bcmd\bvim\0", "setup", "vim-operator-flashy")
time([[Setup for vim-operator-flashy]], false)
time([[packadd for vim-operator-flashy]], true)
vim.cmd [[packadd vim-operator-flashy]]
time([[packadd for vim-operator-flashy]], false)
-- Setup for: vim-gitgutter
time([[Setup for vim-gitgutter]], true)
try_loadstring("\27LJ\2\nX\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0009so $XDG_CONFIG_HOME/plugins/add/vim-gitgutter.rc.vim\bcmd\bvim\0", "setup", "vim-gitgutter")
time([[Setup for vim-gitgutter]], false)
time([[packadd for vim-gitgutter]], true)
vim.cmd [[packadd vim-gitgutter]]
time([[packadd for vim-gitgutter]], false)
-- Setup for: vim-quickrun
time([[Setup for vim-quickrun]], true)
try_loadstring("\27LJ\2\nW\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0008so $XDG_CONFIG_HOME/plugins/add/vim-quickrun.rc.vim\bcmd\bvim\0", "setup", "vim-quickrun")
time([[Setup for vim-quickrun]], false)
time([[packadd for vim-quickrun]], true)
vim.cmd [[packadd vim-quickrun]]
time([[packadd for vim-quickrun]], false)
-- Setup for: clever-f.vim
time([[Setup for clever-f.vim]], true)
try_loadstring("\27LJ\2\nW\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0008so $XDG_CONFIG_HOME/plugins/add/clever-f.vim.rc.vim\bcmd\bvim\0", "setup", "clever-f.vim")
time([[Setup for clever-f.vim]], false)
time([[packadd for clever-f.vim]], true)
vim.cmd [[packadd clever-f.vim]]
time([[packadd for clever-f.vim]], false)
-- Setup for: yankround.vim
time([[Setup for yankround.vim]], true)
try_loadstring("\27LJ\2\nX\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0009so $XDG_CONFIG_HOME/plugins/add/yankround.vim.rc.vim\bcmd\bvim\0", "setup", "yankround.vim")
time([[Setup for yankround.vim]], false)
time([[packadd for yankround.vim]], true)
vim.cmd [[packadd yankround.vim]]
time([[packadd for yankround.vim]], false)
-- Setup for: grep.vim
time([[Setup for grep.vim]], true)
try_loadstring("\27LJ\2\nS\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0004so $XDG_CONFIG_HOME/plugins/add/grep.vim.rc.vim\bcmd\bvim\0", "setup", "grep.vim")
time([[Setup for grep.vim]], false)
time([[packadd for grep.vim]], true)
vim.cmd [[packadd grep.vim]]
time([[packadd for grep.vim]], false)
-- Setup for: vim-markdown
time([[Setup for vim-markdown]], true)
try_loadstring("\27LJ\2\nW\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0008so $XDG_CONFIG_HOME/plugins/add/vim-markdown.rc.vim\bcmd\bvim\0", "setup", "vim-markdown")
time([[Setup for vim-markdown]], false)
-- Setup for: lexima.vim
time([[Setup for lexima.vim]], true)
try_loadstring("\27LJ\2\n>\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\0\0=\1\2\0K\0\1\0!lexima_accept_pum_with_enter\6g\bvim\0", "setup", "lexima.vim")
time([[Setup for lexima.vim]], false)
time([[packadd for lexima.vim]], true)
vim.cmd [[packadd lexima.vim]]
time([[packadd for lexima.vim]], false)
-- Config for: vim-asterisk
time([[Config for vim-asterisk]], true)
try_loadstring("\27LJ\2\nZ\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0;so $XDG_CONFIG_HOME/plugins/source/vim-asterisk.rc.vim\bcmd\bvim\0", "config", "vim-asterisk")
time([[Config for vim-asterisk]], false)
-- Config for: switch.vim
time([[Config for switch.vim]], true)
try_loadstring("\27LJ\2\nX\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0009so $XDG_CONFIG_HOME/plugins/source/switch.vim.rc.vim\bcmd\bvim\0", "config", "switch.vim")
time([[Config for switch.vim]], false)
-- Config for: lightline.vim
time([[Config for lightline.vim]], true)
try_loadstring("\27LJ\2\n[\2\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0<so $XDG_CONFIG_HOME/plugins/source/lightline.vim.rc.vim\bcmd\bvim\0", "config", "lightline.vim")
time([[Config for lightline.vim]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\2\n5\2\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.filetype_nvim\frequire\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file InspecthiHideInspector lua require("packer.load")({'inspecthi.vim'}, { cmd = "InspecthiHideInspector", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Capture lua require("packer.load")({'capture.vim'}, { cmd = "Capture", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Inspecthi lua require("packer.load")({'inspecthi.vim'}, { cmd = "Inspecthi", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file InspecthiShowInspector lua require("packer.load")({'inspecthi.vim'}, { cmd = "InspecthiShowInspector", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType textile ++once lua require("packer.load")({'vim-textile'}, { ft = "textile" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'vim-prettyprint'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType mkd ++once lua require("packer.load")({'vim-markdown', 'vim-maketable', 'vim-markdown-quote-syntax'}, { ft = "mkd" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-markdown', 'vim-maketable', 'vim-markdown-quote-syntax'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'vim-smartinput-endwise'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-textile/ftdetect/textile.vim]], true)
vim.cmd [[source /home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-textile/ftdetect/textile.vim]]
time([[Sourcing ftdetect script at: /home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-textile/ftdetect/textile.vim]], false)
time([[Sourcing ftdetect script at: /home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/vagrant/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
