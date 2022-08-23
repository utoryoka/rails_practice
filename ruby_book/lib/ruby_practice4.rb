#配列や繰り返し処理を理解する

#RGBカラー変換プログラムの実行例
# puts to_hex(0,0,0)
# puts to_ints('#000000')
# puts to_ints('#ffffff')

puts [].class

#配列の最後に要素を追加する
a = []
a << 1
a << 2
a << 3
p a

#特定の位置の値を削除
a.delete_at(1)
p a

#divmodは商と余を配列で返す
p 14.divmod(3)

#戻り値を配列のまま受け取る
quo_rem = 14.divmod(3)
puts "商=#{quo_rem[0]},余=#{quo_rem[1]}"

#多重代入で別々の変数として受け取る
quotient,remainder = 14.divmod(3)
puts "商=#{quotient},余=#{remainder}"

#繰り返し処理
numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
    sum += n
end
puts sum

a = [1,2,3,1,2,3]
a.delete(2)
p a

#配列から奇数の要素を削除する
a = [1,2,3,1,2,3]
a.delete_if do |n|
    n.odd?
end
p a

numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
    sum_value = n.even? ? n * 10 : n
    sum += sum_value
end
puts sum
#ブロック内で初めて登場した変数なので、外では参照できない
#sum_valueはエラーが出る

#シャドーイング　名前の重複により、他の変数やメソッドが参照できなくなること
numbers =[1,2,3,4]
sum =0
sum_value =100
numbers.each do |sum_value|
    sum += sum_value
end
puts sum
puts sum_value

#ブロックを作る際にdo endだけでなく{}を使うこともできる
numbers =[1,2,3,4]
sum =0
numbers.each {|n| sum += n}
puts sum

#map method
#各要素に対してブロックを評価した結果を新しい配列にして返す
numbers = [1,2,3,4,5]
new_numbers = []
numbers.map {|n| new_numbers << n * 10}
p new_numbers

#select(find_all)/rejectはselectの逆
#各要素に対してブロックを評価し、その戻り値が真の要素を集めた配列を返すメソッド
numbers  = [1,2,3,4,5,6]
#ブロックの戻り値が真になった要素だけが集められる
even_numbers = numbers.select {|n| n.even? }
p even_numbers

#find(detect)
#ブロックの戻り値が真になった最初の要素を返す
numbers =[1,2,3,4,5]
even_numbers = numbers.find { |n| n.even?}
puts even_numbers

#sum
#要素の合計を求めるメソッド
numbers = [1,2,3,4]
puts numbers.sum
#各要素を２倍にしながら合計する
puts numbers.sum {|n| n * 2}
#初期値に5を指定する
puts numbers.sum(5)
#文字列も合計することができる
chars =['a', 'b', 'c', 'd']
puts chars.sum('')
#joinを使うこともできる
puts chars.join
#区切り文字を-にして各要素を連結する
puts chars.join('-')

#数値が含まれていても大丈夫（to-sメソッドで文字列に変換されるため）
data = ['a',1,'b',2]
puts data.join
#sumメソッドを使用すると空白文字以外の初期値を与えたり、ブロック内の文字列を加工したりすることができる
puts chars.sum('>'){|n| n.upcase}

puts ['ruby','java','python'].map {|s| s.upcase}
#上記のコードを書き換えることができる
puts ['ruby','java','python'].map(&:upcase)

p [1,2,3,4,5,6].select {|n| n.odd?}
p [1,2,3,4,5,6].select(&:odd?)

#range
#..を使うと5が範囲に含まれる（１以上５以下）
p range = 1..5
p range.include?(0)
p range.include?(1)
p range.include?(4.9)
p range.include?(5)
p range.include?(6)
#...を使うと5が範囲に含まれない(1以上5未満)
p range = 1...5
p range.include?(0)
p range.include?(1)
p range.include?(4.9)
p range.include?(5)
p range.include?(6)

#()で囲めばエラーにならない
p (1...5).include?(1)

#n以上m以下、n以上m未満の判定をする
#不等式を使う場合
def liquid?(temperature)
    # 0以上100未満であれば液体、と判定したい
    0 <= temperature && temperature < 100
end
p liquid?(-1)
p liquid?(0)
p liquid?(99)
p liquid?(100)

#範囲オブジェクトを使う場合
def liquid?(temperature)
    (0...100).include?(temperature)
end
p liquid?(-1)
p liquid?(0)
p liquid?(99)
p liquid?(100)

def charge(age)
    case age
        #0歳から５歳までの場合
    when 0..5
        0
        #6歳から12歳までの場合
    when 6..12
        300
        #13歳から18歳までの場合
    when 13..18
        600
    #それ以外
    else
        1000
    end
end

p charge(3)
p charge(12)
p charge(16)
p charge(25)

#値が連続する配列を作成する
p (1..5).to_a
p (1...5).to_a
p (5..1).to_a
p ('a'..'e').to_a
p ('bad'...'bag').to_a

p [*1..5]

#範囲オブジェクトを配列に変換してから繰り返し処理を行う
numbers =(1..4).to_a
sum = 0
numbers.each{ |n| sum += n}
p sum
sum = 0
#範囲オブジェクトに対して直接eachメソッドを呼び出す
(1..4).each{|n| sum += n}
p sum

numbers = []
#1から10まで二回毎に繰り返し処理を行う
(1..10).step(2) {|n| numbers << n}
p numbers

a = [1,2,3,4,5]
p a[1,3]
p a.values_at(1,3)
p a[-1]
p a[-2]
p a[-2,2]
#最後の値をとってくる
p a.last
p a.last(2)
#最初の値をとってくる
p a.first
p a.first(2)

a =[]
a.push(1)
a.push(2,3)
p a

#2つの配列を連結したい場合はconcatメソッドか、+演算子を使用する
#concatは破壊的メソッド
a=[1]
b=[2,3]
p a + b
p a
p a.concat(b)
p a
p b

#集合
a = [1,2,3]
b = [3,4,5]
#和集合
p a | b
#差集合
p a - b
#積集合
p a & b

#配列よりも集合を効率的に扱うSetを使う
require 'set'
a = Set[1,2,3]
b = Set[3,4,5]
p a|b
p a-b
p a&b

a = []
a.push(1)
p a.push(2,3)

a=[]
a.push(1)
b=[2,3]
p a.push(b)

a=[]
a.push(1)
b=[2,3]
p a.push(*b)

jp = ['japan','日本']
country = '日本'
case country
when *jp
    p 'konitiha'
end

#メソッドの可変長引数
def greet(*names)
    "#{names.join('と')},こんにちは"
end
p greet('tanaka')
p greet('tanaka','suzuki')
p greet('taak','suzu','kou')

a=[1,2,3]
p [a]
p [*a]

p [*a] == [1,2,3]
p [*a] == [1,2,3,4]

#%記法で文字列の配列を簡潔に作る
#[]
p ['apple','orange','orange','orange']
#%w
p %w!apple orange orange orange!
#%w
p %w(apple orange orange orange)
#スペースや改行が連続した場合も一つの区切り文字として認識される
p %w(
    apple
    orange
    orange
)
#値に空白を埋め込みたい場合\
#式展開や改行文字(¥n）、タブ文字(¥t)などを含めたい場合は、%Wを使う
p %w!apple\ small small\ melon orange!

#文字列を配列に変換する
#charsメソッド
p 'Ruby'.chars
#splitメソッド
p 'Ruby,Java,Python'.split(',')

#配列にデフォルト値を設定する
#a = []と同じ
a = Array.new
p a = Array.new(5)

p a = Array.new(10) {|n| n % 3 + 1}

#配列にデフォルト値を設定する場合の注意点
p a = Array.new(5, 'default')
p str = a[0]
p str.upcase!
#全て変わってしまう
#配列の前要素が同じ文字列を参照しているため一つを変更すると他の値も変更されてしまう
p a

#対処法として引数ではなく、ブロックを渡す
p a = Array.new(5){'default'}
p str = a[0].upcase!
p a

#添字付きの繰り返し処理
fruits = %w!apple orange melon!
fruits.each_with_index do |fruit, i|
    puts "#{i}: #{fruit}"
end

fruits.map.with_index { |fruit, i| p "#{i}: #{fruit}" }
p fruits.delete_if.with_index {|fruit, i| fruit.include?('a') && i.odd?}

#with_indexはEnumeratorクラスのインスタントメソッドである。大半のクラスはブロックを省略して呼び出すとEnumeratorクラスを返す
p fruits.each
p fruits.map
p fruits.delete_if

#0以外の添字で開始させる
fruits.each.with_index(1) {|fruit, i| p "#{i}: #{fruit}"}

#配列がブロックパラメータに渡される場合
dimensions = [
    #[hight,width]
    [10,20],
    [30,40],
    [50,60],
]
#面積の計算結果を格納する配列
areas = []
#配列の要素分だけブロックパラメータを用意すると、各要素の値が別々の変数に格納される
dimensions.each do |hight,width|
    areas << hight * width
end
p areas

dimensions.each_with_index do |(hight,width),i|
    puts "hight : #{hight},width : #{width},i: #{i}"
end

#番号指定のパラメータ(使い過ぎると可読性が下がるので書き捨てのスクリプト等に使う)
#使わない場合
#1
['1','20','300'].map {|s| p s.rjust(3, '0')}
#2
['japan','us','italy'].map.with_index {|country,i| p [i,country]}

#使用する場合
#1
['1','20','300'].map { p _1.rjust(3,"0")}
#2
['japan','us','italy'].map.with_index {p [_2,_1]}

#繰り返し処理以外でも使用されるブロック
File.open('./lib/sample.txt','w') do |file|
    file.puts('1行目のテキストです')
    file.puts('2')
    file.puts('3')
end

#do...end {} の違い
#結合度が{}の方が強い
a = [1,2,3]
a.delete 100 do
    p 'ng'
end
#これだと100と{p 'ng'}が結合してしまっているためエラー
#a.delete 100 {p 'ng'}
a.delete(100){p 'ng'}

#メソッドチェーン
names = ['tanaka','suzuki','sato']
p names.map{ |name| "#{name}san"}.join('と')
a = names.map do |name|
    "#{name}san"
end.join('と')
p a

#endless range
a = [1,2,3,4,5,6]
p a[2..]
#前範囲を表す範囲オブジェクト
p a[nil..nil]
p a[nil..]
p a[..nil]

#様々な繰り返し処理
sum = 0
5.times {|n| sum += n}
p sum

a = []
10.upto(14){|n| a << n}
p a

a = []
14.downto(10){|n| a << n}
p a

a= []
1.step(10,2){|n| a << n}
p a

a = []
10.step(1,-2){|n| a << n}
p a

a=[]
while a.size < 5
    a << 1
end
p a
#１行で書くこともできる
a = []
while a.size < 5 do a << 1 end
p a
#こちらの方が見やすい
a =[]
a << 1 while a.size < 5
p a

a = []
begin
    a<< 1
end while false
p a

#until文
a = [10,20,30,40,50]
until a.size <= 3
    a.delete_at(-1)
end
p a

#for文(eachメソッドと違い内部で作成された変数を参照できる)
numbers = [1,2,3,4]
sum = 0
for n in numbers
    sum += n
end
p sum

#無限ループ(while  loop)
#while true
#ループ内の処理
#end

numbers =[1,2,3,4,5]
loop do
    #sampleメソッドでランダムに要素を1つ取得する
    n = numbers.sample
    puts n
    break if n == 5
end

while true
    n = numbers.sample
    puts n
    break if n == 5
end

p '再帰呼び出し'
def factorial(n)
    #引数の値を1減らして、factorialメソッド自信をもう一度呼び出す
    #引数が0になったら1を返して繰り返し処理が終了する
    n > 0 ? n * factorial(n -1) : 1
end
p factorial(5)
p factorial(1)

p '再帰呼び出しの別の書き方'
def factorial_1(n)
    ret = 1
    (1..n).each {|n| ret *= n}
    ret
end

p factorial_1(5)
p factorial_1(1)

#繰り返し処理用の制御構造
#break
#shuffleメソッドで配列の要素をランダムに並び替える
numbers = [1,2,3,4,5].shuffle
numbers.each do |n|
    puts n
    #5が出たら繰り返しを脱出する
    break if n == 5
end

p 'throw catchを使った大域脱出'
fruits = ['apple','melon','orange']
numbers = [1,2,3]
catch :done do
    fruits.shuffle.each do |fruit|
        numbers.shuffle.each do |n|
            puts "#{fruit},#{n}"
            if fruit == 'orange' && n == 3
                throw :done
            end
        end
    end
end

#next
numbers = [1,2,3,4,5]
numbers.each do |n|
    next if n.even?
    puts n
end

#redo
foods = %w!ピーマン トマト セロリ!
count = 0
foods.each do |food|
    print "#{food}は好きですか？ +>"
    answer = ["はい","いいえ"].sample
    puts answer

    #制限なくやり直しが続く可能性があるのでカウントすることを勧める
    count += 1
    redo if answer != 'はい' && count < 2

    count = 0
end