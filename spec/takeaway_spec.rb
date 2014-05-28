require 'takeaway'

describe 'Takeaway' do


let(:dish)                { double :dish, name: "Curry", price: 6.00 }
let(:order)               { double :order, list_dishes: [dish, dish], total: 12.00}
let(:takeaway_with_order) { Takeaway.new (order) }


  it "can print an order" do
    expect(takeaway_with_order.print).to eq "1. Curry, £6.00\n2. Curry, £6.00\n"
  end

	it "checks the totals match" do
	 # expect{takeaway_with_order.matches?(6)}.to raise_error "Totals don't match"
	 expect(takeaway_with_order.matches?(12)).to be_true
  end

	it "knows what time it will be one hour from now" do
		Time.stub(:now => Time.utc(2014, 05, 9, 11, 39, 07))
		expect(takeaway_with_order.calculate_delivery_time).to eq "12:39" 
	end

  it "prepares a message to confirm the order when the totals match" do
    Time.stub(:now => Time.utc(2014, 05, 9, 11, 39, 07))
    expect(takeaway_with_order.prepare_message).to eq "Thank you! Your order was placed and will be delivered before 12:39."
  end

  it "confirms the order via SMS when the totals match" do
    Time.stub(:now => Time.utc(2014, 05, 9, 11, 39, 07))

    expect(takeaway_with_order).to receive(:send_sms).with("+447909542641", "Thank you! Your order was placed and will be delivered before 12:39.")
  	
    takeaway_with_order.confirm_order(12, "+447909542641")
  end
  
end


