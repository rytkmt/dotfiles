require('filetype').setup({
    overrides = {
        -- extensions = {
        --     -- Set the filetype of *.pn files to potion
        --     pn = 'potion'
        -- },
        -- literal = {
        --     -- Set the filetype of files named "MyBackupFile" to lua
        --     MyBackupFile = 'lua',
        -- },
        complex = {
            -- Set the filetype of any full filename matching the regex to gitconfig
            -- luaのescapeは%
            [".*git/config"] = "gitconfig",  -- Included in the plugin
            ["/%.pryrc"] = "ruby",
            ["/*.rake"] = "ruby",
            ["/*.*.schema"] = "ruby",
            ["%.bashrc"] = "bash",
            ["%.env"] = "bash",
            ["%.env%..*"] = "bash",
        },

        -- The same as the ones above except the keys map to functions
        -- function_extensions = {
        --     py = function() 
        --         print('opening a python file!!!')
        --         vim.bo.filetype = 'python'
        --     end
        -- },
        -- function_literal = {
        --     Brewfile = function() 
        --         vim.cmd("syntax off")
        --     end
        -- },
        -- function_complex = {
        -- },
    }
})
