require 'dish'

describe "Dish" do
  
  let (:dish) { Dish.new({:name => "Chips", :price=> 3}) }

  it "has a name when created" do
  	expect(dish.attributes[:name]).to eq "Chips" 
  end

  it "has a price when created" do
  	expect(dish.attributes[:price]).to eq 3
  end
end