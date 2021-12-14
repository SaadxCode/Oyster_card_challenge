class Oystercard 
  attr_reader :balance, :entry_station, :exit_station, :journeys

  DEFAULT_LIMIT = 90
  DEFAULT_MINIMUM = 1

  def initialize 
    @balance = 0
    @in_use = false
    @journeys = {}
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def topup(amount)
    fail "Sorry, topup limit is #{DEFAULT_LIMIT}" if(balance + amount)> DEFAULT_LIMIT 
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end
  
  def touch_in(entry_station)
    fail "Sorry, minimum balance #{DEFAULT_MINIMUM}" if balance < DEFAULT_MINIMUM
    @in_use = true
    @entry_station = entry_station
  end

  def in_journey?
    !!entry_station
  end

  def touch_out(exit_station)
    @balance -= DEFAULT_MINIMUM
    @in_use = false
    @entry_station = nil
    @exit_station = exit_station
    @journeys['n'] = [@entry_station, @exit_station]
  end

end