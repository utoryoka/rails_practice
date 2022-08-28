#クラスの作成を理解する
# class User
#     def initialize
#         puts 'initialize'
#     end
# end

# p User.new

class User
    #newメソッドを呼び出したときに呼ばれる
    def initialize(name,age)
        puts "name: #{name},age: #{age}"
    end
    #インスタンスメソッド
    def hello
        p 'Hello!'
    end
end

#p User.new #失敗する
User.new('Alice',20)
user = User.new('bob',26)
p user.hello

class User1
    attr_accessor :name,:age
    attr_reader :name2
    attr_writer :name3
    def initialize(name)
        #インスタンス作成時に渡された名前をインスタンス変数に保存する
        @name = name
        #@age = 26
    end

    #クラスメソッドの定義
    class << self
        def classmethod
            #クラスメソッドの処理
        end
    end
    def self.create_users(names)
        names.map do |name|
            User1.new(name)
        end
    end

    def hello
        #インスタンス変数に保存されている名前を表示する
        "hello, I am #{@name}."
        "I am #{@age} years"
    end

    def hello1
        #shuffled_nameはローカル変数
        shuffled_name = @name.chars.shuffle.join
        "Hello, I am #{shuffled_name}."
    end
end
user = User1.new('Alice')
p user.hello
p user.hello1

# ||==を使ったメモ化や遅延初期化

#selfキーワード
class UserSelf
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def hello
        #selfなしでnameメソッドを呼ぶ
        "hello, I am #{name}"
    end

    def hi
        #self付きでnameメソッドを呼ぶ
        "hi, I am #{self.name}"
    end

    def my_name
        #直接インスタンス変数の@nameにアクセスする
        "my name is #{@name}"
    end

    def rename_to_bob
        #selfなしでname=メソッドを呼ぶ
        name = 'Bob'
    end

    def rename_to_carol
        #self付きでname=メソッドを呼ぶ
        self.name = 'Carol'
    end

    def rename_to_dave
        #直接インスタンス変数の@nameにアクセスする
        @name = 'Dave'
    end
end

user = UserSelf.new('Alice')
p user.hello
p user.hi
p user.my_name

user.rename_to_bob
p user.name
user.rename_to_carol
p user.name
p user.hello
user.rename_to_dave
p user.name

p user.hello

#クラスメソッドをインスタンスメソッドで呼び出す
class Product
    attr_reader :name, :price

    def initialize(name, price)
        @name = name
        @price = price
    end

    def self.format_price(price)
        "#{price}yen"
    end

    def to_s
        #インスタンスメソッドからクラスメソッドを呼び出す
        #formatted_price = Product.format_price(price)
        formatted_price = self.class.format_price(price)
        "name: #{name}, price: #{formatted_price}"
    end
end

product = Product.new('A great movie',1000)
p product.to_s

#Objectクラスから継承したメソッドの一覧を確認できる
p user.methods.sort
p user.is_a?(BasicObject)
p user.is_a?(Object)
p user.is_a?(User)

class Product
    attr_reader :name ,:price
    def initialize(name,price)
        @name = name
        @price = price
    end
end
#DVDクラスはProductクラスを継承する
class DVD < Product
    attr_reader :running_time

    def initialize(name,price,running_time)
        #スーパークラスのinitializeメソッドを呼び出す
        super(name,price)
        @running_time = running_time
    end
end

dvd = DVD.new('A great movie', 1000, 120)
p dvd.name
p dvd.price
p dvd.running_time

#可視性
#public
#publicメソッドはクラスの外部からでも自由に呼び出せるメソッド
#initializeメソッド以外のインスタンスメソッドはデフォルトでpublicメソッドになる

#private
class UserPrivate
#ここから下で定義されたメソッドはprivate
    private

    def hello
        'Hello'
    end
end

user = UserPrivate.new
#privateメソッドなのでクラスの外から呼び出せない
#user.hello
#クラスメソッドをプライベートにしたい場合
class UserPrivateClassMethod

    class << self
        #class << selfの構文ならクラスメソッドでもprivateが機能する
        private
        def hello
            'hello'
        end
    end
    #あとからプライベートメソッドに変更する
    #private_class_method :hello
end
#UserPrivateClassMethod.hello

class User
    private attr_accessor :name
    def initialize(name)
        @name = name
    end
end

user = User.new('Alice')
# p user.name
# p user.name = 'Bob'

class User
    #weightは外部に公開しない
    attr_reader :name
    def initialize(name,weight)
        @name = name
        @weight = weight
    end

    #自分がother_userより重たい場合はtrue
    def heavier_than?(other_user)
        other_user.weight < @weight
    end

    protected

    #protectedメソッドなので同じクラスかサブクラスであればレシーバ付きで呼び出せる
    def weight
        @weight
    end
end

alice = User.new('Alice',50)
bob = User.new('Bob',60)

#同じクラスのインスタンスメソッド内であればweightが呼び出せる
alice.heavier_than?(bob)
bob.heavier_than?(alice)

#クラスの外ではweightは呼び出せない
#alice.weight

#定数について
#クラスの外側から直接干渉できる
class Product
    DEFAULT_PRICE = 0
    #定数をprivateにする
    #private_constant :DEFAULT_PRICE
end

p Product::DEFAULT_PRICE
#クラスを凍結
#Product.freeze
#freezeすると変更できなくなる
p Product::DEFAULT_PRICE = 5000


#エイリアスメソッドの定義
class User2
    def hello
        'hello!'
    end
    #helloメソッドのエイリアスメソッドとしてgreetを定義する
    alias greet hello
end

user = User2.new
p user.hello
p user.greet

#メソッドの削除
#undef 削除するメソッド名

#クラスの中にクラスを作る
# class 外側のクラス
#     class 内側のクラス
#     end
# end

class CountryCode
    attr_reader :code
    def initialize(code)
        @code = code
    end

    def eql?(other)
        other.instance_of?(CountryCode) && code.eql?(other.code)
    end

    def hash
        code.hash
    end
end
japan =CountryCode.new('JP')
us = CountryCode.new('US')
india = CountryCode.new('IN')

currencies = {japan => 'yen', us => 'doller', india => 'rupee'}
key = CountryCode.new('JP')
p currencies[key]
p currencies[japan]


#オープンクラスとモンキーパッチ
class Mystring < String
    #stringクラスを拡張するためのコード
end
s = Mystring.new('hello')
p s
p s.class

class MyArray < Array
    #Arrayクラスを拡張するためのコード
end
a = MyArray.new()
a << 1
a << 2
p a
p a.class

class String
    #文字列をランダムにシャッフルする
    def shuffle
        chars.shuffle.join
    end
end

s = 'Hello, I am Alice'
p s.shuffle
p s.shuffle

#rails console内で実行する必要あり
#　文字列をキャメルケースからスネークケースに変換する
# p 'MyString'.underscore
#レシーバが引数の配列に含まれていれあTrueを返す
# numbers = [1, 2, 3]
# p 2.in?(numbers)
# p 5.in?(numbers)

#以下のUserクラスは外部ライブラリで定義されている想定
class User3
    def initialize(name)
        @name = name
    end

    def hello
        "hello,#{@name}"
    end
end

#モンキーパッチを当てる前の挙動を確認する
user = User3.new('Alice')
p user.hello
#helloメソッドにモンキーパッチを当てて独特の挙動を持たせる
class User3
    def hello
        "#{@name}さん、こんにちは"
    end
end
#挙動が変わっている
p user.hello


#特異メソッド
#オブジェクト単位で挙動を変える
alice = 'I am Alice'
bob = 'I am Bob'
def alice.shuffle
    chars.shuffle.join
end

p alice.shuffle
p bob.class
p bob.shuffle

class User4

end
#クラス構文の外部でクラスメソッドを定義する方法1
def User4.hello
    'hello.'
end

#クラス構文の外部でクラスメソッドを定義する方法2
class << User4
    def hi
        'hi.'
    end
end
p User4.hello
p User4.hi


#ダックタイピング
def display_name(object)
    puts "Name is <<#{object.name}"
end
class User5
    def name
        'Alice'
    end
end

class Product1
    def name
        'A great movie'
    end
end
#User5クラスとProductクラスはお互いに無関係なクラスだが、display_nameメソッドは何も気にしない
user = User5.new
display_name(user)
product = Product1.new
display_name(product)


class Product2
    def initialize(name,price)
        @name = name
        @price = price
    end

    def display_text
        #stock?メソッドはサブクラスで必ず実装してもらう想定
        stock = stock? ? 'あり' : 'なし'
        "商品名:#{@name} value:#{@price}yen stock: #{stock}"
    end
end

class DVD2 < Product2
    #在庫があればtrueを返す
    def stock?
        #省略
        true
    end
end

product = Product2.new('A great film', 1000)
#スーパークラスではstock?メソッドを持たないのでエラーになる
#p product.display_text
dvd = DVD2.new('An awesome film', 3000)
p dvd.display_text

