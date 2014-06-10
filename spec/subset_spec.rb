require_relative 'spec_helper'

describe Subset do
	before :all do
		@sum = 10
		@set = [1, 3, 5, 7, 9, 11, 15]
		@subset = Subset.new(@set, @sum)
		@emptySet = Subset.new([], @sum)
		@zeroSet = Subset.new(@set, 0)
		@noMatch = Subset.new(@set, 2000)
		@bothEmpty = Subset.new([], 0)
	end
	
	describe "#initialize" do
		it "should only have items in the set less than or equal to the sum" do
			@subset.set.each do |item|
				expect(item).to be <= @sum				
			end
		end
	end
	
	describe "#findSubset" do
		context "when it has a match" do			
			subject (:foundSet) { @subset.findSubset }
			it "should find a match" do
				expect(foundSet.set.size).to be > 0
			end		
			it "should find a match equal to the sum" do
				expect(foundSet.sum).to be == @sum
			end
		end
		context "when it has no match" do
			it "should return nil" do
				expect(@noMatch.findSubset).to be == nil
			end		
		end
		context "when the sum is zero" do
			it "should return nil" do
				expect(@zeroSet.findSubset).to be == nil
			end
		end
		context "when the set is empty" do
			it "should return nil" do
				expect(@emptySet.findSubset).to be == nil
			end
		end
		context "when the sum is zero and the set is empty" do
			it "should return nil" do
				expect(@bothEmpty.findSubset).to be == nil
			end
		end
	end
end