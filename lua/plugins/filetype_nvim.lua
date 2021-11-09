vim.g.did_load_filetypes = 1
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
            [".*git/config"] = "gitconfig",  -- Included in the plugin
            ["/.pryrc"] = "ruby",
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
