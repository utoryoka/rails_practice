# #モジュールを理解する
# #helloメソッドを持つGreatableモジュールを定義
# module Greatable
#     def hello
#         'hello'
#     end
# end

# module Loggable
#     #Logメソッドはprivateメソッドにする
#     #private

#     def log(text)
#         puts "[LOG] #{text}"
#     end
# end

# class Product
#     include Loggable
# end

# product = Product.new
# product.log 'public?'

# #include先のメソッドを使うモジュール
# module Taggable
#     def price_tag
#         #priceメソッドはinclude先で定義されているはず、という前提
#         "#{self.price}yen"
#     end
# end

# class Product
#     include Taggable
#     def price
#         1000
#     end
# end

# product = Product.new
# p product.price_tag

# class Product1
#     #Loggableモジュールのメソッドを特異メソッドとして追加する
#     extend Loggable

#     def self.create_products(names)
#         #logメソッドをクラスメソッド内で呼び出す
#         log 'create_products is called'
#     end
# end

# Product1.create_products([])
# Product1.log('hello')

# #モジュールの追加方法
# Product.include Loggable
# Product.extend Loggable


# #includeされているかどうかわかる
# p Product.include?(Loggable)
# #incudeされているモジュールの配列が返す
# p Product.included_modules
# #ancestorsメソッドを使うとモジュールだけでなくスーパークラスの情報も配列になって返る
# p Product.ancestors

# product = Product.new
# p product.class.include?(Loggable)
# p product.class.included_modules
# #is_a?メソッドを使えば、直接インスタンスに対して自クラスがそのモジュールをincludeしているかどうかがわかる
# product = Product.new
# p product.is_a?(Product)
# p product.is_a?(Loggable)
# p product.is_a?(Object)

# #Enumerableモジュール(eachメソッドが実装されていること)
# Array.include?(Enumerable)
# Hash.include?(Enumerable)
# Range.include?(Enumerable)

# #map select find count
# p [1,2,3].map { |n| n * 10}
# p({ a: 1, b: 2, c: 3 }.map { |k,v| [k,v * 10]})
# p (1..3).map { |n| n * 10}

# p [1,2,3].count
# p({ a: 1, b: 2, c: 3 }.count)
# p (1..3).count

# #Comparalbeモジュール
# #< <= == > >= between?
# # <=>演算子を実装する必要がある
# #<=>演算子は宇宙船演算子と呼ばれ、以下の結果を返すように実装する
# #aがbより大きいなら正の整数
# #aがbと等しいなら0
# #aがbより小さいなら負の整数
# #aとbが比較できない場合はnil
# p 2 <=> 1
# p 2 <=> 2
# p 1 <=> 2
# p 2 <=> 'abc'
# p 'xyz' <=> 'abc'
# p 'abc' <=> 'abc'
# p 'abc' <=> 'xyz'
# p 'abc' <=> 123

# #文字列や数値はComparableモジュールもincludeしている
# p 2 > 1
# p 'abc' == 'xyz'

# class Tempo
#     include Comparable

#     attr_reader :bpm

#     #bpmはBeats Per Minuteの略で音楽の速さを表す単位
#     def initialize(bpm)
#         @bpm = bpm
#     end

#     #<=>はComparableモジュールで使われる演算子（メソッド）
#     def <=>(other)
#         #otherがTempoであればbpm同士を<=>で比較した結果を返す
#         #それ以外は比較できないのでnilを返す
#         other.is_a?(Tempo) ? bpm <=> other.bpm : nil
#     end

#     #irb上で結果を見やすくするためにinspectメソッドをオーバーライド
#     def inspect
#         "#{bpm}bpm"
#     end
# end

# t_120 = Tempo.new(120)
# t_180 = Tempo.new(180)

# p t_120 > t_180
# p t_120 <= t_180
# p t_120 == t_180

# tempos = [Tempo.new(180), Tempo.new(60), Tempo.new(120)]
# #sortメソッドの内部では並び替えの際に<=>演算子が使われる
# p tempos.sort

# p self
# p self.class


# class User
#     p self
#     p self.class
# end
# p User.class
# p Class.superclass
# module Loggable
#     p self
#     p self.class
# end
# p Loggable.class
# p Module.superclass

# module NameChangeable
#     def change_name
#         #あまり良くない設計
#         #@name = 'アリス'
#         #モジュールがミックスイン先のクラスでインスタンスを直接参照するのはあまり良くない

#         #セッターメソッド経由でデータを変更する
#         self.name = 'アリス'
#     end
# end

# class User
#     include NameChangeable
#     #attr_reader :name
#     #ゲッターメソッドとセッターメソッドを用意する
#     attr_accessor :name

#     def initialize(name)
#         @name = name
#     end
# end

# user = User.new('alice')
# user.name

# #モジュールで定義したメソッドでインスタンス変数を書き換える
# user.change_name
# p user.name

# module Loggable
#     def log(text)
#         puts "[LOG] #{text}"
#     end
# end

# s = 'abc'

# #文字列は通常logメソッドを持たない
# # p s.log('hello')

# #文字列sにLoggableモジュールをextendして、特異メソッドを定義する
# s.extend Loggable

# #Loggableモジュールのlogメソッドが呼び出せるようになる
# s.log('hello')


# #入れ子なしで名前空間付きのクラスを定義する
# #既にbasebollモジュールが定義されている
# module Baseball

# end
# #モジュール名::クラス名の形でクラスを定義できる
# # class Baseball::Second
# #     def initialize(player, uniform_number)
# #         @player = player
# #         @uniform_number = uniformNumber
# #     end
# # end
# class Second
#     def initialize(player, uniform_number)
#         @player = player
#         @uniform_number = uniform_number
#     end
# end

# module Clock
#     class Second
#         def initialize(digits)
#             @digits = digits
#             @baseball_second = ::Second.new('Alice', 13)
#         end
#     end
# end

# Clock::Second.new(13)

# module Baseball
#     class File

#     end
# end

# module Baseball
#     class Second
#         def file_with_nesting
#             puts File
#         end
#     end
# end

# class Baseball::Second
#     def file_without_nesting
#         puts File
#     end
# end

# second = Baseball::Second.new
# second.file_with_nesting
# second.file_without_nesting



# #モジュールに特異メソッドを定義する
# module Loggable
#     #特異メソッドとしてメソッドを定義する
#     # def self.log(text)
#     #     puts "[LOG] #{text}"
#     # end
# end

# module Loggable
#     #別の書き方
#     class << self
#         def log(text)
#             puts "[LOG] #{text}"
#         end
#         #他の特異メソッドを定義する
#     end
# end

# #他のクラスにミックスインしなくても利用できる
# Loggable.log('Hello')



#module_functionメソッド
module Loggable
    def log(text)
        puts "[LOG] #{text}"
    end
    #logメソッドをミックスインとしても、モジュールの特異メソッドとしても使えるようにする
    #module_functionは対象メソッドの定義よりも下のところで呼び出すこと
    module_function :log
end

#モジュールの特異メソッドとしてlogメソッドを呼び出す
Loggable.log('Hello')

#Loggableモジュールをincludeしたクラスを定義する
class Product
    include Loggable
    def title
        #includeしたLoggableモジュールのlogメソッドを呼び出す
        log 'title is called'
        'A great movie'
    end
end

#ミックスインとしてlogメソッドを呼び出す
product = Product.new
product.title

#モジュールに定数を定義する
module Loggable
    PREFIX = '[LOG]'
    def log(text)
        puts "#{PREFIX} #{text}"
    end
end

#定数を参照する
p Loggable::PREFIX

p Math.sqrt(2)

class Calculator
    include Math
    def calc_sqrt(n)
        sqrt(n)
    end
end

calculator = Calculator.new
p calculator.calc_sqrt(2)
p Math::E
p Math::PI

module A
    def to_s
        "<A> #{super}"
    end
end

class Product
    #includeではなくprependを使う
    prepend A
    def to_s
        "<Product> #{super}"
    end
end

product = Product.new
p product.to_s
p Product.ancestors

class Product1
    #includeではなくprependを使う
    include A
    def to_s
        "<Product> #{super}"
    end
end

product = Product1.new
p product.to_s
p Product1.ancestors


#このクラスは外部ライブラリで定義されている想定
class Product2
    def name
        'A great film'
    end
end

product = Product2.new
product.name

#prependするためのモジュールを定義する
module NameDecorator
    def name
        #prependするとsuperはミックスインした先のクラスnameメソッドが呼び出される
        "<<#{super}>>"
    end
end

class Product2
    #includeではなくprependでミックスインする
    prepend NameDecorator

end

#NameDecoratorをprependしたので、nameメソッドは装飾された文字列がかえる
product = Product2.new
p product.name


#有効範囲を限定できるrefinements
module StringShuffle
    #refinementsが目的なので、refineメソッドを使う
    refine String do
        def shuffle
            chars.shuffle.join
        end
    end
end

#通常はStringクラスにshuffleメソッドはない
# p 'Alice'.shuffle

class User
    #refinementsを有効化
    using StringShuffle
    def initialize(name)
        @name = name
    end

    def shuffle_name
        #Userクラスの内部であればStringクラスのshuffleメソッドが有効になる
        @name.shuffle
    end
    #userクラスを抜けるとrefinementsは無効になる
end

user = User.new('Alice')
#Userクラス内ではshuffleメソッドが有効になっている
p user.shuffle_name

#Userクラスを経由しない場合はshuffleメソッドは使えない
# 'Alice'.shuffle