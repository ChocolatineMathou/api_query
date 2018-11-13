require './lib/purchases'

purchases = Purchases.new

case ARGV[0]
when 'most_sold'
  purchases.most_sold
else
  p 'I did not understand your question'
end
