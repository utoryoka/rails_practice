#4.6 例題：RGB変換プログラムを作成する
#p119

def to_hex(r, g, b)
    #三回も繰り返しを行う処理を書いていると修正時がめんどくさいので、簡略化する
    # '#' +
    # r.to_s(16).rjust(2,'0') +
    # g.to_s(16).rjust(2,'0') +
    # b.to_s(16).rjust(2,'0')

    # hex = '#'
    # [r,g,b].each do |n|
    #     hex += n.to_s(16).rjust(2,'0')
    # end
    # p hex

    [r,g,b].sum('#') do |n|
        n.to_s(16).rjust(2,'0')
    end
end

def to_ints(hex)
    # r = hex[1..2]
    # g = hex[3..4]
    # b = hex[5..6]
    r,g,b = hex[1..2],hex[3..4],hex[5..6]
    # r,g,b = hex.scan(/\w\w/)
    [r,g,b].map do |s|
        s.hex
    end
end
#さらにコードを短くする(リファクタリング)
# def to_ints(hex)
#     # hex.scan(/\w\w/).map do |s|
#     #     s.hex
#     # end
#     hex.scan(/\w\w/).map(&:hex)
# end

#ruby 3.0であればこんな書き方も可能
#def to_ints(hex) = hex.scan(/\w\w/).map(&:hex)

p '#12abcd'.scan(/\w\w/)

