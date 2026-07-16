require("scrollbar").setup({
    handle = {
        text = "  ",
        blend = 30, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
        color = "#323843",
    },
    marks = {
        Cursor = {
            text = " ",
            priorityk= 0,
            highlight = "Normal",
        },
    --     Search = {
    --     },
        Error = {
            text = { " " },
            priority = 2,
            highlight = "Error",
        },
        Warn = {
            text = { " " },
            priority = 3,
            highlight = "WarningMsg",
        },
        Info = {
            text = { " " },
            priority = 4,
            highlight = "Keyword",
        },
        Hint = {
            text = { "󰌵 " },
            priority = 5,
            highlight = "Debug",
        },
        Misc = {
            text = { " " },
            priority = 6,
            highlight = "Comment",
        },
    },
    excluded_buftypes = {
        "terminal",
    },
    excluded_filetypes = {
        "dropbar_menu",
        "dropbar_menu_fzf",
        "DressingInput",
        "cmp_docs",
        "cmp_menu",
        "noice",
        "prompt",
        "TelescopePrompt",
    },
    autocmd = {
        render = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
        },
        clear = {
            "BufWinLeave",
            "TabLeave",
            "TermLeave",
            "WinLeave",
        },
    },
    handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = false, -- Requires gitsigns
        handle = true,
        search = false, -- Requires hlslens
        ale = false, -- Requires ALE
    },
})
