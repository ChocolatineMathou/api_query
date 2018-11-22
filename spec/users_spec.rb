require 'users'

mock_users = JSON.parse(File.read('./spec/data/users.json'))['data']
mock_purchases = JSON.parse(File.read('./spec/data/purchases.json'))['data']

describe Users do

  let(:subject) { described_class.new(api) }
  let(:api) { double :api }

  describe '#total_spend' do

    before do
      allow(api).to receive(:fetch_data).with('users').and_return(mock_users)
      allow(api).to receive(:fetch_data).with('purchases').and_return(mock_purchases)
    end

    it 'calls total_spend' do
      allow(subject).to receive(:total_spend).with('schimmel_quincy@ernser.io')
      subject.total_spend('schimmel_quincy@ernser.io')
    end

    it 'retrieves the total spend for a given email' do
      expect(subject.total_spend('schimmel_quincy@ernser.io')).to eq(245.01)
    end

    it "raises an error message if user does not exist" do
      expect { subject.total_spend('dummy@email.com') }.to raise_error("User does not exist")
    end
  end

  describe '#most_loyal' do

    before do
      allow(api).to receive(:fetch_data).with('users').and_return(mock_users)
      allow(api).to receive(:fetch_data).with('purchases').and_return(mock_purchases)
    end

    it 'calls most_loyal' do
      allow(subject).to receive(:most_loyal)
      subject.most_loyal
    end

    it 'retrieves the most loyal user' do
      expect(subject.most_loyal).to eq('travis_kshlerin@wunsch.net')
    end
  end
end
