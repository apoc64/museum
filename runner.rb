require_relative "lib/museum"
require_relative "lib/patron"
require_relative "lib/exhibit"

#
# Iteration 4 - The Runner
# Build a runner file that simulates interactions with a single museum. A user should be able to interface with our code through the command line in the following manner:
#
puts "Hey! What do you want to call your museum?"
name = gets.chomp
museum = Museum.new(name)

puts "Cool! you have a museum named #{museum.name}"

# At startup, the program will ask the user for the name of the museum
# The user can press 'e' to add an exhibit to the museum
# The user can press 'a' to admit a new patron to the museum
# The user can press 'r' to see the total revenue generated
# The user can press 't' to see the top exhibits
# The user can press 'u' to remove unpopular exhibits
# The user can press 'q' to exit the program
