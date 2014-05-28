require 'twilio-ruby'
require 'time'
require 'twilio_client'

class Takeaway

include TwilioClient

  def initialize(order)
  	@order = order
  end
  
  def print
  	i = 0
  	result = ""
  	@order.list_dishes.each do |dish|
      name = dish.name
  		price = sprintf("%.2f", dish.price)
  		result += "#{i += 1}. #{name}, £#{price}\n"
  	end
  	result
  end
  
  def matches?(total)
    total == @order.total
  end

  def calculate_delivery_time
  	t = Time.now+60*60
  	t.strftime("%H:%M")
  end
  
  def confirm_order(total, customer_number)  
    raise "Totals don't match" if !matches?(total)
    send_sms(customer_number, prepare_message)
  end

  def prepare_message(delivery_time=calculate_delivery_time)
    "Thank you! Your order was placed and will be delivered before #{delivery_time}."
  end   


end
