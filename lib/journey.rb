class Journey

attr_reader :journey_history, :completed

	PENALTY_FARE = 6

	def initialize(station = nil)
		@entry_station = station
		@completed = false
	end

	def exit(station = nil)
		complete_journey
		@journey_history = {"entry_station": @entry_station, "exit_station": station}
	end

	def fare
	  @journey_history[:exit_station] && @journey_history[:entry_station] ? OysterCard::MINIMUM_AMOUNT : PENALTY_FARE
	end

	private

	def complete_journey
	  @completed = true
	end

end
