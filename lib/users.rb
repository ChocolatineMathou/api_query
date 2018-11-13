require_relative 'query_api'

class Users

  attr_reader :users, :items

  def initialize(api = API.new)
    @users = api.fetch_data('users')
    @items = api.fetch_data('purchases')
  end

  def total_spend(email)
    user_id = find_user('email', email, 'id')
    expense = 0
    @items.each do |item|
      expense += item['spend'].to_f if item['user_id'] == user_id
    end
    expense
  end

  def most_loyal
    all_user_id = @items.map { |purchase| purchase['user_id'] }
    loyalty = Hash.new(0)
    all_user_id.map do |id|
      loyalty[id] += 1
    end
    sorted_loyal_user = loyalty.max_by { |key, value| key }
    user_id = sorted_loyal_user[0]
    find_user('id', user_id, 'email')
  end

  private

  def find_user(value, given_value, return_value)
    user_id = nil
    @users.each do |user|
      user_id = user[return_value] if user[value] == given_value
    end
    user_id
  end

end
