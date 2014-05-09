require 'twilio-ruby'
require 'time'

class Takeaway

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
  
  def confirm(total)
  	raise "Totals don't match" if total != @order.total 
    self
  end
  
  def calculate_delivery_time
  	t = Time.now+60*60
  	t.strftime("%H:%M")
  end
  
  def prepare_message
    @time = self.calculate_delivery_time
  	"Thank you! Your order was placed and will be delivered before #{@time}."
  end

end