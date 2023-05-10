require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

#1を入力したら
if memo_type == 1
  puts "拡張子を除いたファイル名を入力してください"
  
  file_name = gets.chomp #getsメソッドでキーボード入力を受け付け、変数に入れる。末尾の改行をchompメソッドで除去

  puts "メモしたい内容を記入してください"
  puts "Ctrl + D で入力終了します"

  memo = STDIN.read #STDINで標準出力を受け付け、後に表示するためreadメソッドをつけmemoに入れる。

  CSV.open("#{file_name}.csv",'w', :encoding => "utf-8") do |text|  
    text << ["#{memo}"] #これによってcsvに書き込まれる
  end
  puts "\n--------"
  puts memo
  puts "--------"
  puts "以上の内容で保存されました"

elsif memo_type == 2
  puts "拡張子を除いたファイル名を入力してください"
  file_name_2 = gets.chomp
  puts "編集したい内容を記入してください"
  puts "Ctrl + D で入力終了します"

  memo = STDIN.read

  CSV.open("#{file_name_2}.csv",'a', :encoding => "utf-8") do |text|
    text << ["#{memo}"]
  end

  puts "\n--------"
  puts memo
  puts "--------"
  puts "以上の内容で保存されました"

else
  puts "1か2のどちらかを入力してください"
end
