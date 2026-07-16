local ok, configs = pcall(require, 'nvim-treesitter.configs')
if ok then
  configs.setup {
    ensure_installed = { "lua", "ruby", "markdown", "yaml", "json" },
    sync_install = false,
    highlight = {
      enable = true,
      disable = { "yaml", "help" },
      additional_vim_regex_highlighting = false,
    },
    matchup = {
      enable = true,
      disable = { "help" },
    },
    playground = {
      enable = true,
      disable = { "help" },
      updatetime = 25,
      persist_queries = false,
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    }
  }
end
