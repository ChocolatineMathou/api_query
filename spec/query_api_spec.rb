require 'query_api'

mock_purchases = JSON.parse(File.read('./spec/data/purchases.json'))
mock_users = JSON.parse(File.read('./spec/data/users.json'))

describe API do

  let(:api) { described_class.new }

  describe '#fetch data' do

    it 'retrieves users from the API' do
          allow(api).to receive(:fetch_data).with('users').and_return(mock_users)
          expect(api.fetch_data('users')).to eq mock_users
        end

        it 'retrieves purchases from the API' do
          allow(api).to receive(:fetch_data).with('purchases').and_return(mock_purchases)
          expect(api.fetch_data('purchases')).to eq mock_purchases
        end

        it 'raises an error if the API is not available' do
          allow(api).to receive(:status?).and_return false
          expect { api.fetch_data('users') }.to raise_error('API unavailable')
        end

  end
end
