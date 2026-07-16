-- H1があればH1直後に、なければページトップにTOCを挿入する
-- また、PDFメタデータのtitleをH1テキストまたは入力ファイル名から設定する
function Pandoc(doc)
  local toc_depth = 3
  local toc_title = doc.meta["toc-title"] and pandoc.utils.stringify(doc.meta["toc-title"]) or "目次"

  -- H1を探してtitleを設定
  local h1_text = nil
  for _, block in ipairs(doc.blocks) do
    if block.t == "Header" and block.level == 1 then
      h1_text = pandoc.utils.stringify(block.content)
      break
    end
  end

  if h1_text then
    doc.meta.title = pandoc.MetaInlines({pandoc.Str(h1_text)})
  else
    local input_files = PANDOC_STATE.input_files
    if input_files and #input_files > 0 then
      local filepath = input_files[1]
      local basename = filepath:match("([^/]+)$") or filepath
      local stem = basename:match("(.+)%.[^.]+$") or basename
      doc.meta.title = pandoc.MetaInlines({pandoc.Str(stem)})
    end
  end

  -- TOC対象ヘッダー収集 (H1除外)
  local headers = {}
  for _, block in ipairs(doc.blocks) do
    if block.t == "Header" and block.level >= 2 and block.level <= toc_depth then
      table.insert(headers, block)
    end
  end

  if #headers == 0 then return doc end

  -- ネストされたTOCリストを構築
  local function build_toc(hdrs)
    local result = {}
    local i = 1
    while i <= #hdrs do
      local h = hdrs[i]
      local link = pandoc.Link(h.content, "#" .. h.identifier)
      local item_blocks = {pandoc.Plain({link})}

      -- サブリスト収集
      local sub_headers = {}
      local j = i + 1
      while j <= #hdrs and hdrs[j].level > h.level do
        table.insert(sub_headers, hdrs[j])
        j = j + 1
      end

      if #sub_headers > 0 then
        table.insert(item_blocks, pandoc.BulletList(build_toc(sub_headers)))
      end

      table.insert(result, item_blocks)
      i = j
    end
    return result
  end

  local toc_list = pandoc.BulletList(build_toc(headers))
  local toc_content = {}
  if toc_title ~= "" then
    table.insert(toc_content, pandoc.Header(2, pandoc.Str(toc_title), pandoc.Attr("", {"toc-title"}, {})))
  end
  table.insert(toc_content, toc_list)
  local toc_nav = pandoc.Div(toc_content, pandoc.Attr("TOC", {}, {{"role", "doc-toc"}}))

  -- H1の位置を探す
  local h1_pos = nil
  for i, block in ipairs(doc.blocks) do
    if block.t == "Header" and block.level == 1 then
      h1_pos = i
      break
    end
  end

  -- TOC挿入
  if h1_pos then
    doc.blocks:insert(h1_pos + 1, toc_nav)
  else
    doc.blocks:insert(1, toc_nav)
  end

  return doc
end
