require 'journey'
require 'oystercard'
describe Journey do
	subject(:journey) { described_class.new(entry_station) }
	let(:card)  { double(:card, :touch_in => true, :touch_out => true) }
	let(:entry_station)  { double(:entry_station) }
  let(:exit_station)  { double(:exit_station) }

  context '#in_journey?' do


    end


  context 'start journey' do

          it 'remembers entry station' do
          	expect(journey.instance_variable_get(:@entry_station)).to eq entry_station
          end

    end

  context 'end journey' do

      it 'stores entry station when exiting' do
				journey.exit
        expect(journey.journey_history[:entry_station]).to eq entry_station
      end

      it 'stores exit station when exiting' do
        journey.exit(exit_station)
        expect(journey.journey_history[:exit_station]).to eq exit_station
      end

			it 'changes completed to true when exiting' do
				journey.exit
				expect(journey.completed).to eq true
			end

    end

   describe '#fare' do

    it 'calulates the correct fare if complete journey' do
      journey.exit(exit_station)
      expect(journey.fare).to eq OysterCard::MINIMUM_AMOUNT
    end

    it 'calculate the correct fare if incomplete journey' do
			journey.exit
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

  end







end
