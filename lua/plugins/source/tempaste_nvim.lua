require("tempaste").setup({
  templates_dir = "$PRIVATE_DOTFILES_DIR/.templates/commons/",
  filetype_templates_dir = "$PRIVATE_DOTFILES_DIR/.templates/file_types/",
})
require("telescope").load_extension("tempaste")
