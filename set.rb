class Set
	attr_accessor :set, :sum
	def initialize (set)
		@set = set
		@sum = generateSum(set)
	end
	
	def generateSum(set)
		sum = 0
		set.each do |item|
			sum += item
		end
		return sum
	end
	
	def to_s
		return "set: #{@set}, sum: #{@sum}"
	end
end