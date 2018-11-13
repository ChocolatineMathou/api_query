require_relative 'query_api'

class Purchases

  attr_reader :items

  def initialize(api = API.new)
    @items = api.fetch_data('purchases')
  end

  def most_sold
    @items.map { |purchase| purchase['item'] }
    most_sold = item_frequency.max_by { |_key, value| value }
    p most_sold[0]
  end

  private

  def item_frequency
    freq = Hash.new(0)
    @items.map do |purchases|
      freq[purchases['item']] += 1
    end
    freq
  end

end
