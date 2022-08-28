#モジュールを理解する
#helloメソッドを持つGreatableモジュールを定義
module Greatable
    def hello
        'hello'
    end
end

module Loggable
    #Logメソッドはprivateメソッドにする
    #private

    def log(text)
        puts "[LOG] #{text}"
    end
end

class Product
    include Loggable
end

product = Product.new
product.log 'public?'

#include先のメソッドを使うモジュール
module Taggable
    def price_tag
        #priceメソッドはinclude先で定義されているはず、という前提
        "#{self.price}yen"
    end
end

class Product
    include Taggable
    def price
        1000
    end
end

product = Product.new
p product.price_tag

class Product1
    #Loggableモジュールのメソッドを特異メソッドとして追加する
    extend Loggable

    def self.create_products(names)
        #logメソッドをクラスメソッド内で呼び出す
        log 'create_products is called'
    end
end

Product1.create_products([])
Product1.log('hello')

#モジュールの追加方法
Product.include Loggable
Product.extend Loggable
