class Oystercard 
  attr_reader :balance

  DEFAULT_LIMIT = 90
  DEFAULT_MINIMUM = 1

  def initialize 
    @balance = 0
    @in_use = false
  end

  def topup(amount)
    fail "Sorry, topup limit is #{DEFAULT_LIMIT}" if(balance + amount)> DEFAULT_LIMIT 
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end
  
  def touch_in
    fail "Sorry, minimum balance #{DEFAULT_MINIMUM}" if balance < DEFAULT_MINIMUM
    @in_use = true
  end

  def in_journey?
    @in_use
  end

  def touch_out
    @balance -= DEFAULT_MINIMUM
    @in_use = false
  end

end