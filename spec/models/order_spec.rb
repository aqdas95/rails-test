require 'rails_helper'

RSpec.describe Order, type: :model do
  it "validates that the amount > 0, coin in ['ETH', 'ADA', 'XLM'] and one of extra1 or extra2 must be provided (extra1 provided)" do
    order = Order.new(coin: "ADA",amount: 12.3456789012345678, extra1: "either this field")
    expect(order).to be_valid
  end

  it "validates that the amount > 0, coin in ['ETH', 'ADA', 'XLM'] and one of extra1 or extra2 must be provided (extra2 provided)" do
    order = Order.new(coin: "ADA",amount: 12.3456789012345678, extra2: "either this field")
    expect(order).to be_valid
  end

  it "Should not create when coin not in ['ETH', 'ADA', 'XLM']" do
    expect {Order.new(coin: "BTC",amount: 12.3456789012345678, extra1: "either this field")}.to raise_error(ArgumentError)
  end

  it "Should not create when extra1 and extra2 missing" do
    order = Order.new(coin: "ADA",amount: 12.3456789012345678)
    expect(order).to_not be_valid
  end

  it "Should not create when extra1 and extra2 both present" do
    order = Order.new(coin: "ADA",amount: 12.3456789012345678, extra1: "either this field", extra2: "extra")
    expect(order).to_not be_valid
  end

  it "should not create an order if amount <= 0" do
    order = Order.new(coin: "ADA",amount: 0, extra1: "either this field",
      extra2: "")
    expect(order).to_not be_valid
  end
end
