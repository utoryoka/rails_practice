# country = 'itary'
# greeting =
#     if country == 'japan'
#         puts 'こんにちは'
#     elsif country == 'us' then 'hello'
#     elsif country == 'itary'
#         puts 'Ciao'
#     else
#         puts '???'
#     end

# point = 7
# day = 1
# point *= 5 if day == 1
# puts point

# def add(a, b)
#     a + b
# end
# c = add(1, 2)
# puts c

# def greet(country)
#     #こんにちはまたはhelloがメソッドの戻り値になる
#     #returnをつけたくなるがつけない
#     if country == 'japan' then 'konitiha'
#     else
#         'hello'
#     end
# end
# puts greet('japan')
# puts greet('us')

country = nil
def greet_1(country)
    return 'countryを入力してください' if country.nil?
    if country == 'japan'
        'konitiha'
    else
        'hello'
    end
end
puts greet_1(nil)
puts greet_1('japan')

something = 'hello'
puts %!he said, "#{something}"!
puts %q<he said, "#{something}">

#ヒアドキュメント
a = <<TEXT
これはヒアドキュメントです。
複数行にわたる長い文字列を作成するのに便利です。
TEXT
puts a

def some_method_1
    <<-TEXT
    これはヒアドキュメントです。
    <<-を使うと最後の識別子をインデントさせることができます。
    TEXT
end

puts some_method_1

def some_method_2
    <<~TEXT
    これはヒアドキュメントです。
    <<~を使うと内部文字列のインデント部分が無視されます。
    \ 各行の行頭に半角スペースを２文字入れます。
    \ この時行頭はバックスラッシュで指定します。
    TEXT
end

puts some_method_2

name = 'alice'
a = <<~TEXT
ようこそ、#{name}さん！
以下のメッセージをご覧ください。
TEXT
puts a
#式展開無効
b = <<~'TEXT'
ようこそ、#{name}さん！
以下のメッセージをご覧ください。
TEXT
puts b
#式展開有効
c = <<~TEXT
ようこそ、#{name}さん！
以下のメッセージをご覧ください。
TEXT
puts c

#ヒアドキュメントを直接引数として渡す(prependは渡された文字列を先頭に追加するメソッド)
a = 'ruby'
a.prepend(<<TEXT)
Java
Python
TEXT
puts a

#ヒアドキュメントで作成した文字列に対して、直接upcaseメソッドを呼び出す(upcaseは文字列を全て大文字にするメソッド)
b = <<TEXT.upcase
Hello,
Good-bye.
TEXT
puts b

#ヒアドキュメントを2つ同時に使って配列を作る
c = [<<TEXT1,<<TEXT2]
Alice
Bob
TEXT1
Matz
Jnchito
TEXT2

puts "c[0]は#{c[0]}"
puts "c[1]は#{c[1]}"

puts sprintf('%0.3f',1.2)
puts '%0.3f' % 1.2

#文字列作成
123.to_s
#配列の各要素を連結して1つの文字列にする
puts [10,20,30].join
#　*演算子を使って文字列を繰り返す
puts 'Hi!' * 10

#ダブルクオートと\uを組み合わせてUnicodeのコードポイントから文字列を作成することも可能
puts "\u3042\u3044\u3046"
#4桁ない場合はエラーが出るので下記の書き方で対処する
#puts "\u41"
puts "\u0041"
puts "\u{41}"

#架空のコード例（真偽値が確定した時点で評価が終了されることを活用した架空のコード例）
#Alice,Bob,Carolと順に検索し、最初に見つかったユーザを変数に格納する
#user = find_user('Alice') || find_user('Bob') || find_user('Carol')
#正常なユーザであればメールを送信する（左辺が偽であればメール送信は実行されない）
#user.vaild? && send_email_to(user)

a = <<~TEXT
優先順位
高い !
    &&
    ||
    not
低い and or
TEXT

def greet_2(country)
    #countryがnil（またはfalse）ならメッセージを返してメソッドを抜ける
    country or return 'countryを入力してください'

    if country == 'japan'
        'konitiha'
    else
        'hello'
    end
end

puts greet_2(nil)
puts greet_2('japan')

#unless文　falseの場合、実行する
status ='error'
if status != 'ok'
    puts '何か異常があります(if)'
end

unless status == 'ok'
    puts '何か異常があります（unless）'
else
    puts '正常です'
end

#直接変数に入れることもできる
message =
unless status == 'ok'
    '何か異常があります(massage)'
else
    '正常です'
end

puts message

#case文
country ='us'

case country
when 'japan'
    puts 'konitiha'
when 'us'
    puts 'hello'
when 'italy'
    puts 'ciao'
else
    puts '???'
end

#case文(複数条件を指定でき、どれかを満たせば実行する)
country ='アメリカ'

case country
when 'japan','日本'
    puts 'konitiha'
when 'us','アメリカ'
    puts 'hello'
when 'italy','イタリア'
    puts 'ciao'
else
    puts '???'
end

#条件演算子(三項演算子)
n = 11
message = n > 10 ? '10より大きい' : '10以下'
puts message
#if文で記述
if n > 10
    puts 'n>10'
else
    puts 'n<=10'
end