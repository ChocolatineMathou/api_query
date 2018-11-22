require './lib/purchases'
require './lib/users'

class App

  def initialize(purchases = Purchases.new, users = Users.new)
    @purchases = purchases
    @users = users
  end

  def run(question, argument = nil)
    case question
    when 'most_sold'
      p @purchases.most_sold
    when 'total_spend'
      p argument.nil? ? "Email not provided" : @users.total_spend(argument)
    when 'most_loyal'
      p @users.most_loyal
    else
      p 'I did not understand your question.'
    end
  end
end

if $0 == __FILE__
  begin
    App.new.run(ARGV[0], ARGV[1])
  rescue => error
    p error
  end
end
