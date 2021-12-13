require 'oystercard'

describe Oystercard do
  it "has a balance of 0" do
    expect(subject.balance).to eq 0
  end

  it "can be topped up" do
    subject.topup(10) 
    expect(subject.balance).to eq 10
  end

  it "has a limit of £#{Oystercard::DEFAULT_LIMIT}" do
    subject.topup(Oystercard::DEFAULT_LIMIT) 
    expect { subject.topup(0.01) }.to  raise_error "Sorry, topup limit is #{Oystercard::DEFAULT_LIMIT}"
  end

  it "can have money deducted" do
    subject.deduct(5) 
    expect(subject.balance).to eq -5
  end
  
  describe "#touch_in" do
    it "can touch in" do
      subject.topup(Oystercard::DEFAULT_MINIMUM)
      subject.touch_in 
      expect(subject).to be_in_journey
    end


    it "raises an error if balance is too low" do
      allow(subject).to receive(:balance) {Oystercard::DEFAULT_MINIMUM - 0.01}
      expect { subject.touch_in }.to  raise_error "Sorry, minimum balance #{Oystercard::DEFAULT_MINIMUM}"
    end
  end

  describe "#touch_out" do
    it "can touch out" do
      subject.touch_out
      expect(subject).to_not be_in_journey
    end

    it "reduces by #{Oystercard::DEFAULT_MINIMUM}" do
      expect { subject.touch_out }.to change{ subject.balance }.by(-Oystercard::DEFAULT_MINIMUM)
    end
  end

end