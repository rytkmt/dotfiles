setlocal dictionary+=~/.config/nvim/repos/github.com/takkii/ruby-dictionary3/autoload/source/ruby_method_deoplete
call deoplete#custom#source(
 \ 'dictionary', 'ruby', ['[^. *\t]\.\w*\|\h\w*::'])
