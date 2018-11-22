require './app'

describe App do

  subject { described_class.new(purchases, users) }
  let(:purchases) { double :purchases, most_sold: 'An item' }
  let(:users) { double :users, total_spend: 92, most_loyal: 'A user' }

  it 'calls run with a random question' do
    expect { subject.run('Just a random question') }.to output("\"I did not understand your question.\"\n").to_stdout
  end

  it 'calls most_sold' do
    expect { subject.run('most_sold') }.to output("\"An item\"\n").to_stdout
  end

  it 'calls total_spend - email not provided' do
    expect { subject.run('total_spend') }.to output("\"Email not provided\"\n").to_stdout
  end

  it 'calls total_spend - correct email provided' do
    expect { subject.run('total_spend', 'email@email.com') }.to output("92\n").to_stdout
  end

  it 'calls most_loyal' do
    expect { subject.run('most_loyal') }.to output("\"A user\"\n").to_stdout
  end

end
