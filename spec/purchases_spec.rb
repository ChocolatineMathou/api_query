require 'purchases'

mock_purchases = JSON.parse(File.read('./spec/data/purchases.json'))['data']

describe Purchases do

  let(:subject) { described_class.new(api) }
  let(:api) { double :api }

  describe '#most_sold' do

    before do
      allow(api).to receive(:fetch_data).with('purchases').and_return(mock_purchases)
    end

    it 'calls #most_sold' do
      allow(subject).to receive(:most_sold)
      subject.most_sold
    end

    it 'retrieves the most sold item' do
      expect(subject.most_sold).to eq('Heavy Duty Concrete Watch')
    end
  end
end
