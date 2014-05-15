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
  		attributes = dish.attributes
  		price = sprintf("%.2f",attributes[:price])
  		result += "#{i += 1}. #{attributes[:name]}, £#{price}\n"
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
    if matches?(total)
      send_sms(customer_number, prepare_message)
    else
      raise "Totals don't match"
    end
  end

  def prepare_message(delivery_time=calculate_delivery_time)
    "Thank you! Your order was placed and will be delivered before #{delivery_time}."
  end   


end
