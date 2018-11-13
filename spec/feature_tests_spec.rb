describe 'app' do

  it 'returns the most sold item' do
    most_sold = `ruby app.rb most_sold`
    expect(most_sold).to eq("\"Heavy Duty Concrete Watch\"\n")
  end

  it 'returns the total spend for a given email' do
    total_spend = `ruby app.rb total_spend schimmel_quincy@ernser.io`
    expect(total_spend).to eq("245.01\n")

  end

  it 'returns a nice sentence if the program does not understand the command' do
    wrong_command = `ruby app.rb hello_world`
    expect(wrong_command).to eq("\"I did not understand your question.\"\n")
  end
end
