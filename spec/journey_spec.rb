require 'journey'

describe Journey do

  subject(:journey1) {described_class.new}
  let(:exit_station) {double :exit_station}
  let(:card) {double(:card, :top_up => 1, :touch_in => true, :touch_out => true)}
  let(:entry_station) {double :entry_station, :name => "station_name", :zone => 1}

  # it 'creates a new journey' do
  #   expect(described_class.new(entry_station)).to be_a(Journey)
  # end

  # it 'starts a journey' do
  #   expect(subject.instance_variable_get(:@entry_station)).to eq entry_station
  # end

  # it 'checks that a new journey stores the entry station' do
  #   journey = described_class.new(station)
  #   expect(journey.entry_station).to eq station
  # end

  # it 'checks that a new journey stores the entry stations zone & name' do
  #   journey = described_class.new(station)
  #   expect(journey.entry_station.zone).to eq 1
  #   expect(journey.entry_station.name).to eq "station_name"
  # end

   it 'stores the entry station' do
    subject = Journey.new(entry_station)
    expect(subject.previous_journeys).to eq ({'entry_station' => entry_station})
  end


  describe '#previous_journeys' do
    it 'if no entry station passsed, entry_station = nil' do
    subject = Journey.new
     expect(subject.previous_journeys).to eq ({'entry_station' => nil})
    end
    end

     it 'lists previous journeys' do
      subject = Journey.new(entry_station)
      subject.exit(exit_station)
      expect(subject.previous_journeys).to eq ({'entry_station' => entry_station, 'exit_station' => exit_station})
    end

    it 'checks if journey incomplete' do
    subject = Journey.new
    expect(subject.previous_journeys).to eq ({'entry_station' => nil})
    expect(subject.complete).to eq(false)
    end

     it 'returns incomplete journey initially' do
      expect(subject.complete).to eq false
    end


    it 'returns true when journey completed ' do
    subject = Journey.new(entry_station)
    subject.exit(exit_station)
    expect(subject.complete).to eq(true)
    end


    it 'charges the penalty fare if incomplete journey' do
    subject = Journey.new(entry_station)
    expect(subject.fare).to eq Journey::PENALTY_CHARGE
    end

     it 'charges the correct fare if complete journey' do
    subject = Journey.new(entry_station)
    subject.exit(exit_station)
    expect(subject.fare).to eq OysterCard::MINIMUM_CHARGE
    end


end
