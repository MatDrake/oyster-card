require "make_oystercard.rb"
describe OysterCard do

  it "Balance = 0" do
    expect(subject.balance).to eq 0
  end
describe "#top_up"do
  it "tops up the card is empty"do
    subject.top_up(65)
    expect(subject.balance).to eq 65
  end
  it "tops up the card when the card has money"do
  subject.top_up(10)
  subject.top_up(20)
  expect(subject.balance).to eq 30
  end
  it "has a maximum balance"do
  expect{ subject.top_up(OysterCard::MAX_BALANCE + 1) }.to raise_error "Amount exceeds the limit: #{OysterCard::MAX_BALANCE}"
  end
end
  describe '#deduct' do
  it 'demostrates tha the money is actually deducted' do
  subject.top_up(10)
  expect{ subject.deduct 6}. to change{ subject.balance}.by -6
  end
  it 'return the amount deducted' do
  subject.top_up(10)
  expect(subject.deduct 6).to eq 6
  end
  end
  it { is_expected.to respond_to(:in_journey?) }

  describe '#touch_in'do
    it "allows you to touch in"do
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end
  end
  describe '#touch_out'do
    it 'allows you to touch out'do
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
  end
end
