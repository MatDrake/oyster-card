require 'oystercard'

RSpec.describe Card do

limit = Card::MAXIMUM_LIMIT

	it 'creates a new card' do
		expect(Card.new).to be_a(Card)
	end

	context 'balance' do

		it 'has a balance of zero' do
		expect(subject.balance).to eq(0)
		end
	end

	context 'top ups' do

		it {is_expected.to respond_to(:top_up).with(1).argument }

		it 'tops up the balance' do
		expect{ subject.top_up(1) }.to change{ subject.balance }.by(1)
		end

	end

	context 'limit' do

		it {is_expected.to respond_to(:limit)}

		it "has a limit of #{limit}" do
		expect(subject.limit).to eq(limit)
		end

		it 'has a default limit' do
		expect(subject.limit).to eq limit # Card::MAXIMUM_LIMIT
		end

		it "cannot exceed #{limit}" do
		message = "You cannot exceed the £#{limit} limit!"
		subject.top_up(limit)  # the value needs to be less than the limit less what is topped up in test (so if default value = 90, and you top up 1 or more, you need value of 89 or less)
		expect{subject.top_up(1)}.to raise_error(message)
		end
	end

  context 'deducts' do

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts from balance' do
    expect{subject.deduct(1)}.to change{ subject.balance }.by(-1)
    end

  end

  context 'card in use' do

    it { is_expected.to respond_to(:touch_in)}
    it { is_expected.to respond_to(:touch_out)}
    it { is_expected.to respond_to(:in_journey?)}

    it 'it is not in a journey ?' do
    expect(subject.in_journey?).to eq false
    end

  end

  context 'topped up' do

    it 'needs to be topped up' do
    subject.top_up(limit)
    end

    it 'can touch in' do
    subject.touch_in
    expect(subject).to be_in_journey
    end

    it 'can touch out' do
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
    end

  end


end






