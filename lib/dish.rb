class	Dish

	attr_accessor :attributes
	
	def initialize(attributes={:name =>"", :price => 0})
		@attributes = attributes
	end
	
end
