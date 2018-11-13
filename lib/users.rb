require_relative 'query_api'

class Users

  attr_reader :users, :items

  def initialize(api = API.new)
    @users = api.fetch_data('users')
    @items = api.fetch_data('purchases')
  end

  def total_spend(email)
    user_id = find_user_id('email', email, 'id')
    expense = 0
    @items.each do |item|
      expense += item['spend'].to_f if item['user_id'] == user_id
    end
    expense
  end

  private

  def find_user_id(email, given_email, id)
    user_id = nil
    @users.each do |user|
      user_id = user[id] if user[email] == given_email
    end
    user_id    
  end

end
