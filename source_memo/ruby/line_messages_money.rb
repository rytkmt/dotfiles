path = "/tmp/nvim.r_tsukamoto/mIHrwt/0"

TYPES = %w[
  きいちゃん
  食材
  外食
  交通
  雑費
  美容
  医療
  交際
  服
]
# 電気・水道・ローン・携帯・ネットなどは別

def parse_line_messages(path)
  File.open(path, "r") do |f|
    lines = f.readlines(chomp: true)
    date_grouped_lines = lines.slice_before(&:empty?).to_h { [_1[1], _1[2..]] }
    date_grouped_lines
      .transform_values { |lines|
        lines
          .slice_before { |line| line.start_with?(/\d{1,2}:\d{2}/) }
          .map { |words| words.join("\n") }
      }
      .flat_map { |date, words| words.map { |w| "#{date}\t#{w}" } }
      .grep_v(/メッセージの送信を取り消し/)
      .map do |line|
        values = line.split("\t")
        h = %i[date time person message].zip(values).to_h

        h[:date].slice!(/\(.\)$/)

        price = 0
        h[:origin] = h[:message].dup
        h[:message].gsub!(/\d+/) { |matched| price += matched.to_i; "" }
        h[:message] = h[:message].split("\n").join.gsub('"', "").gsub("　", "")
        h[:type] = h[:message].slice!(/^(#{TYPES.join("|")})/)
        h[:message] = h[:message].delete_suffix("円").delete_suffix("費").strip
        h[:price] = price
        h
      end
  end
end

def parsed_hash_to_array(parsed)
  parsed.map { |h| h.values_at(:date, :time, :person, :type, :message, :price) }
end

def validate_parsed_data!(parsed)
  parsed.each do |h|
    raise(TypeError, h.to_s) if h[:type].nil?
  end
end

parsed = parse_line_messages(path)
validate_parsed_data!(parsed)

if false # 切り替えて使う
  # messageの抽出でおかしなものがないかチェック
  pp parsed.reject { _1[:message].empty? }
else
  csv = []
  # ヘッダーいるなら
  # csv << %w[日付 時間 人 種別 備考 金額]
  csv += parsed_hash_to_array(parsed)
  csv.each { puts _1.join("\t") }
end
# 1. 事前に値のチェックをする
# 2. messageの抽出でおかしなものがないかチェック（コンソール出力の結果を見る）
