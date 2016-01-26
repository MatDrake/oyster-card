require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}

  it 'has a balance of zero' do
    expect(oystercard.balance).to eq(0.0)
  end

  it 'can store the balance' do
    expect(oystercard.instance_variable_get(:@balance)).to be_a Float
  end

  it 'has a top_up method' do
    expect(oystercard).to respond_to(:top_up).with(1).argument
  end

  it 'can top up the balance' do
    expect{oystercard.top_up 10}.to change{oystercard.balance}.by 10.0
  end

  context 'when balance is loaded' do

    before do
      oystercard.top_up 90
    end

    it 'has a maximum balance of 90' do
      expect{oystercard.top_up 0.01}.to raise_error 'Over maximum balance'
    end

    it 'can deduct money' do
      expect{oystercard.deduct 10}.to change{oystercard.balance}.to eq 80
    end

    it 'can touch_in to set in_journey to true' do
      expect{oystercard.touch_in}.to change{oystercard.in_journey?}.to eq true
    end

    it 'can touch_out to set in_journey to false' do
      oystercard.touch_in
      expect{oystercard.touch_out}.to change{oystercard.in_journey?}.to eq false
    end

  end

  it 'has an in_journey variable that is false by default' do
    expect(oystercard.instance_variable_get(:@in_journey)).to eq false
  end

  it 'has an in_journey? method that checks in_journey variable' do
    expect(oystercard.in_journey?).to eq false
  end

  it 'cannot touch in while under minimum balance' do
    expect{oystercard.touch_in}.to raise_error 'Balance too low'
  end

end
