require 'HTTParty'

class API

  attr_reader :url

  def initialize
    @url = "https://driftrock-dev-test.herokuapp.com/"
  end

  def fetch_data(endpoint)
    raise 'API unavailable' unless status?

    HTTParty.get(url + endpoint)['data']
  end

  private

  def status?
    HTTParty.get("#{url}status")['status'] == 'ok'
  end

end
