require_relative 'query_api'
require_relative 'helper'

class Purchases

  def initialize(api = API.new)
    @api = api
  end

  def most_sold
    item_frequency = Helper.frequency_map(purchases, 'item')
    most_sold = item_frequency.max_by { |_key, value| value }
    most_sold[0]
  end

  def purchases
    @purchases ||= @api.fetch_data('purchases')
  end

end
