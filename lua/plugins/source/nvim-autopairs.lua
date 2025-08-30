local npairs = require('nvim-autopairs')

npairs.setup()

npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
