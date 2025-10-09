local npairs = require('nvim-autopairs')

-- 自動で(を入力したら)を入力してくれる という基本的なことはこのプラグインで動作した
-- 全角文字でのカッコの自動挿入や、begin-endなどは出来なかった
npairs.setup()

-- 下記はうまくnvim-cmpで動作できず、どのみち自動挿入ではなく補完しかできないようなので無し
-- npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
-- npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
