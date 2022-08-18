def fizz_buzz(n)
    if n % 15 == 0
        puts 'fizz buzz'
    elsif n % 5 == 0
        puts 'buzz'
    elsif n % 3 == 0
        puts 'fizz'
    else
        puts n.to_s
    end
end

puts fizz_buzz(15)
puts fizz_buzz(45)
puts fizz_buzz(90)
puts fizz_buzz(12)
puts fizz_buzz(8)
puts fizz_buzz(2)