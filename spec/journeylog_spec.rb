require 'journeylog'
require 'journey'

describe JourneyLog do

  let(:journey) {double :Journey.new}
  let(:station) {double :station}

  it 'has an empty array for storing journey history' do
    expect(subject.journey_history).to eq []
  end

  it 'creates a new journey' do
    expect(subject.start_journey(station)).to be_a Journey
  end

  it 'returns an incomplete journey' do
    initial_journey = subject.start_journey(station)
    expect(subject.start_journey(station)).to eq initial_journey
  end

  it 'stores a history of completed journeys' do
    initial_journey = subject.start_journey(station)
    expect{subject.exit_journey(station)}.to change{subject.journey_history}.to eq [initial_journey]
  end

  context '#outstanding_charges' do

    it 'stores an incomplete journey' do
      incomplete_journey = subject.start_journey(station)
      expect{subject.outstanding_charges}.to change{subject.journey_history}.to eq [incomplete_journey]
    end

    it 'closes an incomplete_journey' do
      incomplete_journey = subject.start_journey(station)
      expect{subject.outstanding_charges}.to change{subject.current_journey}.to eq nil
    end

    it 'returns correct fare' do
      subject.start_journey(station)
      expect(subject.outstanding_charges).to eq Journey::PENALTY_CHARGE
    end

  end

end
