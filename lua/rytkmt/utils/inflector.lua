local M = {}

-- 複数形化の関数
function M.pluralize(word)
  -- 語尾が 's', 'x', 'z', 'ch', 'sh' の場合、'es' を追加
  if word:match('[sxz]$') or word:match('ch$') or word:match('sh$') then
    return word .. 'es'
  end
  -- 語尾が子音 + 'y' の場合、'y' を 'ies' に変える
  if word:match('[^aeiou]y$') then
    return word:gsub('y$', 'ies')
  end
  -- その他の場合は、語尾に 's' を追加
  return word .. 's'
end

-- 単数形化の関数
function M.singularize(word)
  -- 語尾が 'ies' の場合、'y' に戻す
  if word:match('ies$') then
    return word:gsub('ies$', 'y')
  end
  -- 語尾が 'es' の場合、'es' を削除
  if word:match('[s|x|z]es$') or word:match('ches$') or word:match('shes$') then
    return word:gsub('es$', '')
  end
  -- 語尾が 's' の場合、's' を削除
  if word:match('s$') and not word:match('ss$') then -- 'glass' -> 'glass' のように誤って削除しないための簡易的なチェック
    return word:gsub('s$', '')
  end
  -- それ以外の場合は、そのままの単語を返す
  return word
end

return M
