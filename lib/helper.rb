class Helper

  def self.frequency_map(array, key)
    frequency = Hash.new(0)
    array.each do |element|
      frequency[element[key]] += 1
    end
    frequency
  end

end
