require("csvview").setup({
  view = {
    header_lnum = "auto",  -- Use line 1 as header
    display_mode = "border",
    sticky_header = {
      enabled = true,
      -- separator = "─",  -- Separator line character
      separator = "═",  -- Separator line character
    },
  },
  parser = {
    delimiter = {
      ft = {
        csv = ",",        -- Always use comma for .csv files
        tsv = "\t",       -- Always use tab for .tsv files
      },
    },
    fallbacks = {       -- Try these delimiters in order for other files
      ",",              -- Comma (most common)
      "\t",             -- Tab
      ";",              -- Semicolon
      "|",              -- Pipe
      ":",              -- Colon
      " ",              -- Space
    },
  }
})
