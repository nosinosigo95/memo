require 'csv'

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i

# もし1か2以外が入力されたら、1か2の入力を促す。
until memo_type == 1 || memo_type == 2 do
    puts "1か2を入力してください!!"
end

puts "拡張子を除いたファイルを入力してください"
file_name = gets.chomp
file_name += ".csv"

puts "メモしたい内容を記入してください"
puts "完了したらCtrl+Dを押します"

# 新規
if memo_type == 1
    CSV.open(file_name, 'w') do |csv|
        until(gets.nil?) do
            csv << $_.chomp.split(',')
        end
    end
elsif memo_type == 2
    CSV.open(file_name, 'a') do |csv|
        until(gets.nil?) do
            csv << $_.chomp.split(/[,| ]/)
        end
    end
end



