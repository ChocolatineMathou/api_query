require_relative 'query_api'
require_relative 'helper'

class Users

  def initialize(api = API.new)
    @api = api
  end

  def total_spend(email)
    user_id = find_user('email', email, 'id')
    raise "User does not exist" if user_id.nil?
    expense = 0
    purchases.each do |purchase|
      expense += purchase['spend'].to_f if purchase['user_id'] == user_id
    end
    expense
  end

  def most_loyal
    loyalty = Helper.frequency_map(purchases, 'user_id')
    sorted_loyal_user = loyalty.max_by { |_key, value| value }
    user_id = sorted_loyal_user[0]
    find_user('id', user_id, 'email')
  end

  def purchases
    @purchases ||= @api.fetch_data('purchases')
  end

  def users
    @users ||= @api.fetch_data('users')
  end

  private

  def find_user(value, given_value, return_value)
    user_id = nil
    users.each do |user|
      user_id = user[return_value] if user[value] == given_value
    end
    user_id
  end

end
