require 'dish'

describe "Dish" do
  
  let (:dish) { Dish.new("Chips", 3) }

  it "has a name when created" do
  	expect(dish.name).to eq "Chips" 
  end

  it "has a price when created" do
  	expect(dish.price).to eq 3
  end
end