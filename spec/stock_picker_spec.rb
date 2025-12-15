require "spec_helper"
require "stock_picker"

RSpec.describe "#stock_picker" do
  context "with valid stock prices" do
    it "returns the best days to buy and sell for maximum profit" do
      expect(stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eq([1, 4])
    end

    it "works when the best buy day is at the beginning and the best sell day is later" do
      expect(stock_picker([2, 3, 10, 6, 4, 8, 1])).to eq([0, 2])
    end

    it "returns the correct days when the best profit is in the middle of the array" do
      expect(stock_picker([5, 11, 2, 7, 3, 9, 10])).to eq([2, 6])
    end
  end

  context "with edge cases" do
    it "returns the first profitable pair when multiple pairs have the same profit" do
      expect(stock_picker([3, 3, 6, 6, 6, 9, 9, 1])).to eq([0, 5])
    end

    it "returns an empty array when prices continuously decrease" do
      expect(stock_picker([10, 9, 8, 7, 6, 5, 4])).to eq([])
    end

    it "returns an empty array when there is only one price" do
      expect(stock_picker([10])).to eq([])
    end

    it "returns an empty array when the prices array is empty" do
      expect(stock_picker([])).to eq([])
    end
  end

  context "with boundary conditions" do
    it "handles the case when the highest price occurs before the lowest price" do
      expect(stock_picker([10, 9, 1, 15, 3, 6])).to eq([2, 3])
    end

    it "handles a one-day peak followed by a drop" do
      expect(stock_picker([1, 10, 2, 3, 1])).to eq([0, 1])
    end
  end
end
