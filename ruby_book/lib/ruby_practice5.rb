#ハッシュやシンボルを理解する

#ハッシュ
#ハッシュはキーと値の組み合わせでデータを管理するオブジェクトのこと
#ハッシュを作成する場合は以下のような構文(ハッシュリテラル)を使用する。
#ハッシュにおいてはキーと値の組み合わせが一つの要素となる

#空のハッシュを作る
# {}
# {key1 => value1, key2 => value2,key3 => value3}

#要素の追加、変更、取得
currencies = {'japan' => 'yen','us'=>'doller','india' => 'rupee'}
#イタリアの通貨を追加する
currencies['italy'] = 'euro'
puts currencies
#既存の値を上書きする
currencies['japan']='円'
puts currencies

#ハッシュを使った繰り返し処理
currencies = {'japan' => 'yen','us'=>'doller','india' => 'rupee'}
currencies.each do |key,value|
    puts "#{key}: #{value}"
end
#ブロックパラメータが一つの場合、配列に格納される
currencies.each do |key_value|
    key =key_value[0]
    value = key_value[1]
    puts "#{key}: #{value}"
end

#ハッシュの同値比較、要素数の取得、要素の削除
a = {'x'=>1, 'y'=>2,'z'=>3}
b = {'x'=>1, 'y'=>2,'z'=>3}
p a == b
#順不同（キーと値は一致する必要あり）
c = { 'y'=>2,'z'=>3,'x'=>1}
p a == c
p a.size
p a.delete('y')
p a

#シンボル
:apple
:japan
:ruby_is_fun
p :apple.class
p 'apple'.class

#同じシンボルであれば同じオブジェクト
p :apple.object_id
p :apple.object_id
p :apple.object_id

p 'apple'.object_id
p 'apple'.object_id
p 'apple'.object_id

#シンボルをハッシュのキーにする
currencies = {:japan => 'yen',:us => 'doller', :india =>'rupee'}
p currencies[:japan]
#以下の書き方でも可能
currencies ={ japan: 'yen', us: 'doller', india: 'rupee'}
p currencies[:us]

#キーワード引数を使うと可読性が上がる
def buy_burger(menu,drink: true,potato: true)
    if drink
        p 'drink'
    end
    if potato
        p 'potato'
    end
end
buy_burger('fish',drink: true,potato: true)
#キーワード引数は順番を入れ替えることができる
buy_burger('fish',potato: true,drink: true)
#default値が設定されているので省略することもできる
buy_burger('fish')

#ハッシュで使用頻度の高いメソッド
#keys
#ハッシュのキーを配列として返す
currencies = {japan: 'yen', us: 'doller', india: 'rupee'}
p currencies.keys
#values
#ハッシュの値を配列として返す
p currencies.values
#has_key?(key?,include?,member?)
p currencies.has_key?(:japan)
p currencies.has_key?(:italy)

# **でハッシュを展開させる
h = {us: 'doller',india: 'rupee'}
#変数hの要素を**で展開させる
a = {japan: 'yen', **h}
p a
b = {japan: 'yen'}.merge(h)
p b


#ハッシュを引数として受け取り、擬似キーワード引数を実現する
def buy_burger(menu, options = {})
    drink =options[:drink]
    potato = options[:potato]
    #省略
end
buy_burger('cheese',drink: true,potato: true)

#任意のキーワードを受け付ける**引数
def buy_burger(menu, drink: true, potato: true)
    #省略
end

#saladとchickenは未定義のキーワード引数なのでエラーになる
#buy_burger('fish', drink: true,potato: false,salad: true,chicken: false)
#想定外のキーワードはothers引数で受け取る
def buy_burger(menu, drink: true, potato: false, **others)
#othersはハッシュとして渡される
puts others
end
buy_burger('fish', drink: true,potato: false,salad: true,chicken: false)

#ハッシュを明示的にキーワード引数に変換する**
#非推奨警告の出力を有効化する
Warning[:deprecated] = true
def buy_burger(menu, drink: true,potato: true)
    #省略
end
params = {drink: true,potato: false}
#ruby3では使えない、明示的に変換する必要がある。
#buy_burger('fish', params)
p buy_burger('fish', **params)

#最後がハッシュの場合{}を省略することができる
def buy_burger(menu, options = {})
    puts options
end
#buy_burger('fish',{'drink' => true, 'potato' => false})
buy_burger('fish','drink' => true, 'potato' => false)
#最後がハッシュではない場合はできない

a = ['fish',{drink: true,potato: false}]
p a[0]
p a[1]
b = ['fish',drink: true,potato: false]
p b[0]
p b[1]

#配列からハッシュ、ハッシュから配列へ
currencies = {japan: 'yen', us: 'doller', india: 'rupee'}
p currencies.to_a

array = [[:japan,'yen'],[:us,'doller'],[:india,'rupee']]
p array.to_h

#ハッシュのデフォルト値を理解する
h = Hash.new('hello')
p h
p a = h[:foo]
p b = h[:bar]
#変数aと変数bは同一オブジェクト
p a.equal?(b)
#変数aには快適な変更を適用すると、変数bの値も一緒に変わってしまう
a.upcase!
p a
p b
p h
#ブロックを用いることで都度実行される
h = Hash.new { 'hello' }
a = h[:foo]
b = h[:bar]
a.equal?(b)
a.upcase!
p a
p b
p h

#デフォルト値を返すだけでなく、ハッシュに指定されたキーとデフォルト値を同時に設定する
h = Hash.new { |hash,key| hash[key] = 'hello'}
h[:foo]
h[:bar]
#ハッシュにキーと値が追加されている
p h

#キーワード引数を一切受け取らない**nil引数
def foo(*args)
    p args
end
#**nilなしだと、キーワード引数がハッシュになってargsに格納される
foo(x: 1)

#**nil
def bar(*args, **nil)
    p args
end
#　**nilがあるとキーワード引数を一切受け取らないため、このメソッド呼び出しはエラーになる
#bar(x: 1)
#キーワード引数ではなく、ハッシュオブジェクトを引数として渡すのはok
bar({x: 1})

# ...を使った引数の移譲
def foo(*args, **opts)
    bar(*args, **opts)
end

def bar(a,b,c: 1)
    puts "a=#{a},b=#{b},c=#{c}"
end

foo(10,20,c: 30)


#%記号でシンボルを作成する
p %s!ruby is fun!
#シンボルの配列を作る
p %i!ruby is fun!
#改行文字を含めたり、式展開をする場合
name = 'Alice'
p %i(hello\ngood-bye #{name.upcase})
p %I(hello\ngood-bye #{name.upcase})

#シンボルと文字列の変換
#to_sym  to_s
string = 'apple'
symbol = :apple

p string.to_sym
p symbol == string.to_sym
p symbol.to_s

#respond_to?
#このメソッドはオブジェクトに対して、文字列またはシンボルで指定した名前のメソッドを呼び出せるかどうかを調べることができる
#またこのメソッドはシンボルと文字列を同等に扱うメソッドの一つである。
p 'apple'.respond_to?('include?')
p 'apple'.respond_to?(:include?)
p 'apple'.respond_to?('foo_bar')
p 'apple'.respond_to?(:foo_bar)

#同等に扱わないケースの方が多い
p 'apple'.include?('pp')
#p 'apple'.include?(:pp)