require "tdd"
require "rspec"

describe "my_unique" do
  let(:arr) { [2,2,3,3,4,4,5,5] } 
  let(:new_arr) { [2,3,4,5] }
  
  it "remove dups" do 
    arr.each do |el|
      expect(new_arr.count(el)).to eq(1)
    end
  end

  it "return new arr" do
    expect { my_unique(arr) }.to_not change{arr}
  end
end

describe "two_sum" do 
  let(:arr_1) {[3,7,-1,-3,1]}
  let(:arr_2) {[2,4,5,7,9]}

  it "finds 0 sum" do
    expect(two_sum(arr_1)).to eq([[0,3],[2,4]])
  end

  it "doesn't find 0 sum" do
    expect(two_sum(arr_2)).to eq([])
  end
end

describe "my_transpose" do
  let (:matrix) { [[0,3,6],[1,4,7],[2,5,8]] }

  it "transpose a 2D grid" do
    expect(my_transpose(matrix)).to eq([[0,1,2],[3,4,5],[6,7,8]])
  end
end

describe "stock_picker" do
  let(:arr) { [10,20,50,80,30] }
  let(:arr_2) { [80,70,60,50,40] }

  it "find the most profitable pair of days" do
    expect(stock_picker(arr)).to eq([0,3])
  end

  it "cannot sell stock before you buy it" do
    expect(stock_picker(arr_2)).to eq([])
  end
end