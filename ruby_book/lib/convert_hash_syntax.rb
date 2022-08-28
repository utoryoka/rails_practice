def convert_hash_syntax(old_syntax)
    old_syntax.gsub(/:(\w+) *=> */) do
        "#{$1}: "
    end
end

# old_syntax = <<~TEXT
# {
#     :name => 'Alice',
#     :age=>20,
#     :gender =>  :female
# }
# TEXT

# p convert_hash_syntax(old_syntax)