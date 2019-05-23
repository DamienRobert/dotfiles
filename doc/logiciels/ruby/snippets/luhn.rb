#From http://codereview.stackexchange.com/questions/134439/luhn-algorithm-in-ruby
#Lunh credit card verification algorithm
def luhn card_no
  return false if card_no.empty?
  card_no.chars.reverse.each_slice(2).flat_map do |a, b|
    [a.to_i, *(b.to_i * 2).divmod(10)]
  end.inject(:+) % 10
end
