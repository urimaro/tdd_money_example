RSpec.describe "Money" do
  it "can be multiplied" do
    five = Money.dollar(5)
    expect(five.times(2)).to eq Money.dollar(10)
    expect(five.times(3)).to eq Money.dollar(15)
  end

  it "is considered equal to another one with the same amount" do
    expect(Money.dollar(5)).to eq Money.dollar(5)
    expect(Money.dollar(5)).not_to eq Money.dollar(6)
    expect(Money.franc(5)).not_to eq Money.dollar(5)
  end

  it "returns its currency" do
    expect(Money.dollar(1).currency).to eq "USD"
    expect(Money.franc(1).currency).to eq "CHF"
  end

  it "adds two dollar objects" do
    five = Money.dollar(5)
    sum = five.plus(five)
    bank = Bank.new
    reduced = bank.reduce(sum, "USD")
    expect(reduced).to eq Money.dollar(10)
  end

  it "returns sum when plus was called" do
    five = Money.dollar(5)
    sum = five.plus(five)
    expect(five).to eq sum.augend
    expect(five).to eq sum.addend
  end
end
