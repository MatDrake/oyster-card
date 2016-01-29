require './lib/station.rb'

class Journey

PENALTY_CHARGE = 6

  attr_reader :entry_station, :complete, :previous_journeys

  def initialize(entry_station=nil)
 	@previous_journeys = {}
    @entry_station = entry_station
    @complete = false
    @previous_journeys["entry_station"] = entry_station
  end


  def exit(exit_station)
  	@exit_station = exit_station
  	@previous_journeys["exit_station"] = exit_station
  	complete_journey
  end

  def fare
  	previous_journeys["entry_station"] && @previous_journeys["exit_station"] ? 1 : 6
  	#if entry and exit station in the hash - > min charge else max charge
  end


 private

  def complete_journey
  @complete = true
  end


end
