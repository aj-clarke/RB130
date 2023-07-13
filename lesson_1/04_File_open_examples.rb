my_file = File.open("some_file.txt", "w+")          # creates a file called "some_file.txt" with write/read permissions
# write to this file using my_file.write
my_file.close

# or `File::open` can take a block and automatically close the file after the blocks execution

File.open("some_file.txt", "w+") do |file|
	# write to this file using file.write
end

# after the block executes, the file is automatically closed