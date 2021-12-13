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
end