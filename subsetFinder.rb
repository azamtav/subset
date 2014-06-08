require 'bigdecimal'

if ARGV.size == 0
 puts "Exception: Invalid file name. Run program as: ruby subsetFinder.rb Filename.txt"
 abort
end

menuitems = {}
counter = 0
begin
	file = File.new(ARGV[0], "r")
	while (line = file.gets)		
		if counter == 0
		  totalPrice = BigDecimal.new(line.sub!("$", ""))	
			#puts sprintf( "$%.02f" , totalPrice )
		else
		  item = line.split(",")
			name = item[0]
			price = BigDecimal.new(item[1].sub!("$", ""))
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
	err
end

