class	Dish

	attr_accessor :name
	attr_accessor :price
	
	def initialize(name, price = 0)
		@name = name
		@price = price
	end
	
end
