#minitest の　version確認
#ruby -r minitest -e "puts Minitest::VERSION"

#テストコードの雛形
#minitestを使ったテストコードの基本形
require 'minitest/autorun'

class SampleTest < Minitest::Test
    def test_sample
        assert_equal 'RUBY', 'ruby'.upcase
    end
end

#minitestの検証メソッド
# #aがbと等しければパスする
# assert_equal b,a
# #aが真であればパスする
# assert a
# #aが技であればパスする
# refute a

#わざと失敗するテストケース
class SampleTest < Minitest::Test
    def test_sample2
        #わざと最初の１文字だけを大文字にするメソッドを呼ぶ
        assert_equal 'RUBY', 'ruby'.capitalize
    end
end
