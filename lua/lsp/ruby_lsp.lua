return {
  cmd = { "bundle", "exec", "ruby-lsp" },
  filetypes = { "ruby" },
  root_markers = { "Gemfile", ".git" },
  init_options = {
    formatter = 'standard',
    linters = { 'standard' },
    enabledFeatures = {
      hover = true,
      diagnostics = true,
      definition = true,
      completion = true,
      inlayHint = false,
      signatureHelp = true,
      typeHierarchy = false,
      documentHighlights = true,
      documentLink = false,
      documentSymbols = true, -- nvim-navic にて利用
      codeActions = false,
      codeLens = false,
      foldingRanges = false,
      formatting = false,
      onTypeFormatting = false,
      selectionRanges = false,
      semanticHighlighting = false,
      workspaceSymbol = false
    }
  },
  settings = {}
}
