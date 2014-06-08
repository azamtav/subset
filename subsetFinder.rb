if ARGV.size == 0
 raise "Invalid file name. Run program as: ruby subsetFinder.rb Filename.txt"
end

begin
	file = File.new(ARGV[0], "r")
	while (line = file.gets)
		puts "#{counter}: #{line}"
		counter = counter + 1
	end
	file.close
rescue => err
	puts "Exception: #{err}"
	err
end