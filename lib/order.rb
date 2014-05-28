require "twilio-ruby"
require "dish"

class Order

  def initialize(dishes = [])
    @dishes = dishes
  end

  def has_dish?
	  number_of_dishes? >= 1
  end

  def remove_last_item
    @dishes.delete_at(-1)
  	self
  end

  def number_of_dishes?
    @dishes.length
  end

  def add_dish(addition=Dish.new)
    @dishes<<addition
    self
  end

  def total
    @dishes.inject(0) do |acc, dish|
      acc + dish.price
    end
  end

  def list_dishes
    @dishes
  end


end