require 'helper'

describe Helper do

  let(:mock_data) do
    [{ key: 2 },
    { key: 2 },
    { key: 7 }]
  end

  describe '#frequency_map' do

    it 'takes an array and a key and return the frequency map' do
      expect(Helper.frequency_map(mock_data, :key)).to eq({ 2 => 2, 7 => 1 })
    end

  end
end
