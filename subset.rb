require_relative 'set'

class Subset
	attr_accessor :set, :sum
	
	def initialize(set, sum)
		@sum = sum
		@set = buildSet(set, sum)
	end
	
	def buildSet (set, sum)
		newset = []
		set.each do |item|
			if(item <= sum)
			  newset << item
			end
		end
		newset.sort!.reverse!
		return newset
	end
	
	def findSubset
		if @set.size == 0 && @sum != 0
		  return nil
		end
		if @sum == 0
		  return []
		end
		
		# see if any individual items works
		@set.each do |item|
			if item == sum
			  return [item]
			end
		end
		
		# build all combinations and test them
		options = []
		@set.each do |item|
			subset = []
			options.each do |opt_item|
				s = Set.new(opt_item.set + [item])				
				if s.sum == @sum
					return s
				elsif s.sum < @sum
					puts "Tried #{s.set}"
					subset << s
				end
			end
			options << Set.new([item])
			options += subset
		end
		return nil
	end
end

set = [2.15, 2.75, 3.35, 3.55, 4.20, 5.80]
s = Subset.new(set, 15.05)
foundSet = s.findSubset
puts foundSet