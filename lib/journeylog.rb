class JourneyLog

  attr_reader :current_journey

  def initialize
    @journeys = []
    @current_journey = nil
  end

  def start_journey(station)
    new_journey(station)
  end

  def exit_journey(station)
    @current_journey.exit(station)
    @journeys << @current_journey
    @current_journey = nil
  end

  def journey_history
    journey_log
  end

  def outstanding_charges
    @journeys << @current_journey
    @current_journey = nil
    Journey::PENALTY_CHARGE
  end

  private

  def journey_log
    @journeys
  end

  def new_journey(station)
    if @current_journey == nil
      @current_journey = Journey.new(station)
    else
      @current_journey
    end
  end

end
