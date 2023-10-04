## 複数行の標準出力を加工したい

- `|ruby -lne 'ARGF.read.lines(chomp:true).map { puts _1.delete_prefix("db/tables/").delete_suffix(".schema") }'`

## 特定のファイルの特定の文字列を置換する(grep置換)

`git grep -l -E "\.call\(" -- *.rb|xargs ruby -i -lne 'print $_.gsub(/\.call\(/) { $_.include?("def ") ? _1 : ".(" }'`
