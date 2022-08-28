require 'minitest/autorun'
require_relative ' ../lib/rainbowable'

class RainbowableTest < Minitest::Test
    def test_rainbow
        assert Rainbowable
    end
end