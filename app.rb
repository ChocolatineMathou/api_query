require './lib/purchases'
require './lib/users'

purchases = Purchases.new
users = Users.new

case ARGV[0]
when 'most_sold'
  p purchases.most_sold
when 'total_spend'
  p users.total_spend(ARGV[1])
else
  p 'I did not understand your question'
end
