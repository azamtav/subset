require_relative 'spec_helper'

describe Node do
	before :all do
		@node1 = Node.new([10])
		@node2 = Node.new([1,5,10])
	end
	
	describe "#initialize" do
		it "should generate the correct sum" do
			expect(@node1.sum) == 10
			expect(@node2.sum) == 16
		end
		
		it "should return the correct set" do
			expect(@node1.set) == [10]
			expect(@node2.set) == [1,5,10]
		end
	end
end