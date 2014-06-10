require_relative 'spec_helper'

describe Subset do
	before :all do
		@sum = 10
		@set = [1, 3, 5, 7, 9, 11, 15]
		@subset = Subset.new(@set, @sum)
	end
	
	describe "#initialize" do
		it "should only have items in the set less than or equal to the sum" do
			@subset.set.each do |item|
				expect(item).to be <= @sum				
			end
		end
	end
	
	describe "#findSubset" do
		subject (:foundSet) { @subset.findSubset }
		it "should find a match" do
			expect(foundSet.set.size).to be > 0
		end		
		it "should find a match equal to the sum" do
			expect(foundSet.sum).to be == @sum
		end
	end
end