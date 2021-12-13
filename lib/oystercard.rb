class Oystercard 
  attr_reader :balance

  DEFAULT_LIMIT = 90

  def initialize 
    @balance = 0
  end

  def topup(amount)
    fail "Sorry, topup limit is #{DEFAULT_LIMIT}" if(balance + amount)> DEFAULT_LIMIT 
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

end