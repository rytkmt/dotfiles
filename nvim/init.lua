vim.o.runtimepath = vim.env.XDG_CONFIG_HOME..','..vim.o.runtimepath

pcall(require, 'impatient')

require('vimrc')
