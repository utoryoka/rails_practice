#長さの単位変換プロジェクト
#メートル、フィート、インチの単位を相互に変換する

UNITS = {m: 1.0, ft: 3.28, in: 39.37,}
def convert_length(length,from: :m,to: :m)
    (length / UNITS[from] * UNITS[to]).round(2)
end

#(length / UNITS[from] * UNITS[to]).round(2)
#ここのUNITS[from]は:fromとするとただのシンボルを表すため
#定数の値が入らないことに注意
