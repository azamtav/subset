require_relative 'node'

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
		
		if @set.size == 0 || @sum == 0
		  return nil
		end		
		
		# see if any individual items works
		@set.each do |item|
			if item == sum
			  return Node.new([item])
			end
		end
		
		# build all combinations and test them
		options = []
		@set.each do |item|
			subset = []
			options.each do |opt_item|
				s = Node.new(opt_item.set + [item])				
				if s.sum == @sum
					return s
				elsif s.sum < @sum
					subset << s
				end
			end
			options << Node.new([item])
			options += subset
		end
		
		#if no set found, return nil
		return nil
	end
end