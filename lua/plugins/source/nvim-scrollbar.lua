require("scrollbar").setup({
    marks = {
        Cursor = {
            text = " ",
            priority = 0,
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
    exclude = {
        buftypes = {
            "terminal",
        },
        filetypes = {
            "dropbar_menu",
            "dropbar_menu_fzf",
            "DressingInput",
            "cmp_docs",
            "cmp_menu",
            "noice",
            "prompt",
            "TelescopePrompt",
        },
    },
    providers = {
        cursor = true,
        diagnostic = true,
        gitsigns = false, -- Requires gitsigns
        search = false, -- native search marks
        ale = false, -- Requires ALE
    },
    scrollbar = {
        thumb = {
            text = "  ",
            blend = 0, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
            highlight = { bg = "#4a4f6a" },
        },
        events = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
        },
    },
})
