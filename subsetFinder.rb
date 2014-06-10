require 'bigdecimal'
require_relative 'subset'

if ARGV.size == 0
 puts "Exception: No file provided. Run program as: ruby subsetFinder.rb filename.txt"  
 abort
end

menuitems = {}
arrMenuItems = []
counter = 0
begin
	file = File.new(ARGV[0], "r")
	while (line = file.gets)		
		if counter == 0
		  sum = BigDecimal.new(line.sub!("$", ""))
		else
		  item = line.split(",")
			name = item[0]
			price = BigDecimal.new(item[1].sub!("$", ""))
			arrMenuItems << price
			if(menuitems.has_key?(price))
			  menuitems[price] << name
			else 
			  menuitems[price] = [] << name
			end
		end		
		counter += 1
	end
	file.close	
rescue => err
	puts "Exception: #{err}"
	abort
end

s = Subset.new(arrMenuItems, sum)
subset = s.findSubset
if subset == nil
	puts "No item or combination of items could be found to total #{sprintf('$%.02f', sum)}."
else
	output = "The following items add up to the total: "
	subset.set.each_with_index do |item, index|
		if index > 0
			output += " and "								
		end
		output += menuitems[item][0]
		menuitems[item].delete_at(0)			
	end	  
end
puts output