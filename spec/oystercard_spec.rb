require 'oystercard'
describe OysterCard do
  it 'is initialized with a balance of 0' do
    expect(subject.balance).to eq(0)
  end
end
