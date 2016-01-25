require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}

  it 'has a balance of zero' do
    expect(oystercard.balance).to eq(0.0)
  end

  it 'can store the balance' do
    expect(oystercard.instance_variable_get(:@balance)).to be_a(Float)
  end

  it 'has a top_up method' do
    expect(oystercard).to respond_to(:top_up).with(1).argument
  end

  it 'can top up the balance' do
    expect{ oystercard.top_up 10 }.to change{ oystercard.balance }.by 10.0
  end

  it 'has a maximum balance of 90' do
    expect{ oystercard.top_up 91 }.to raise_error( 'Over maximum balance' )
  end

end
