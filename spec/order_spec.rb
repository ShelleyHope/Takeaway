require "order"

describe "Order" do

  let(:dish) { double :dish, :attributes => {:price => 3} }
	let(:order) { Order.new([dish]) }

  
  it "should have no dishes when created" do
      empty_order = Order.new
  	expect(empty_order).not_to have_dish
  end

  it "can have no dishes" do
  	expect(order.remove_last_item).not_to have_dish
  end

  it "knows how many dishes are in the order" do
  	expect(order.number_of_dishes?).to eq 1
  end

	it "can add a dish to the order" do
	 	empty_order = order.remove_last_item
	  expect(empty_order.number_of_dishes?).to eq 0
	end

  it "can add up the total cost" do
  	neworder = order.add_dish(dish)
  	expect(neworder.total).to eq 6
  end
 
  it "can list the dishes" do
    expect(order.list_dishes).to eq [dish]
  end

end
