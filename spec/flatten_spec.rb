require "flatten"

describe "test two dimensional array" do
  flattened = flatten_array([1, 2, 3, [4, 5, [6, 7]]])

  it "should return [1, 2, 3, 4, 5, 6, 7]" do
    expect(flattened).to eq([1, 2, 3, 4, 5, 6, 7])
  end
end

describe "test three dimensional array" do
  flattened = flatten_array([1, 2, 3, [4, 5, [6, 7, [8, 9]]]])

  it "should return [1, 2, 3, 4, 5, 6, 7, 8, 9]" do
    expect(flattened).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end
end

describe "test four dimensional array" do #
  flattened = flatten_array([1, 2, 3, [4, 5, [6, 7, [8, 9, [10, 11, [12, 13]]]]]])

  it "should return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]" do
    expect(flattened).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13])
  end
end

describe "test empty array" do
  flattened = flatten_array([])

  it "should return []" do
    expect(flattened).to eq([])
  end
end


describe "test something random" do #
  flattened = flatten_array([[[[[[[[[1]]]]]]]]])

  it "should return [1]" do
    expect(flattened).to eq([1])
  end
end


describe "test a non-array" do #
  flattened = flatten_array("random")

  it "should return ['random']" do
    expect(flattened).to eq(["random"])
  end
end
