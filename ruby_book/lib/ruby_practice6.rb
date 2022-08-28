#正規表現の便利さを知る
#https://rubular.com/

text = <<TEXT
I love Ruby.
Python is a great language.
Java and JavaScript are different.
TEXT

p text.scan(/[A-Z][A-Xa-z]+/)

text = <<TEXT
私の郵便番号は1234567です。
僕の住所は7448392 兵庫県北九州市1234だお。
TEXT
puts text.gsub(/(\d{3})(\d{4})/){ "#{$1}-#{$2}"}

text = <<-TEXT
def hello(name)
  puts "Hello, \#{name}!"
end

hello('Alice')
     
hello('Bob')
	
hello('Carol')
TEXT

puts text.gsub(/^[ \t]+$/, '')

text = <<-TEXT
type=zip; filename=users.zip; size=1024;
type=xml; filename=posts.xml; size=2048;
TEXT
p text.scan(/(?<=filename=)[^;]+/)

#/正規表現/

p '123-4567' =~ /\d{3}-\d{4}/
#マッチしたときにfalseを返す
p '123-4567' !~ /\d{3}-\d{4}/

text = '私の誕生日は1977年7月17日です'
m = /(\d+)年(\d+)月(\d+)日/.match(text)
p m
#マッチした部分全体を表示
p m[0]
#キャプチャの一番目を取得する
p m[1]
#キャプチャの2番目から２個取得する
p m[2,2]
#最後のキャプチャを取得する
p m[-1]
#範囲を使って取得
p m[1..-1]
#正規表現とオブジェクトを入れ替えても動作する
m = text.match(/(\d+)年(\d+)月(\d+)日/)
p m

#キャプチャに名前をつける
text = '私の誕生日は1977年7月17日です'

p m = text.match(/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
p m[:year]

#scan
p '123 456 789'.scan(/\d+/)

# /正規表現/
# %r!正規表現!
# %r{正規表現}

