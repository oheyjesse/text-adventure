require_relative 'adventure/globals'
require_relative 'adventure/models/entity'
require_relative 'adventure/models/location'
require_relative 'adventure/models/world'
require_relative 'adventure/controllers/engine'
require_relative 'adventure/views/display'

require 'pry'

# I namespaced the game simply to gain more understanding of how modules/classes
# interact. I've since come to understand it's un-necessary for a standalone
# game like this. But this whole thing is a learning experiment for me, so...

world = create_world(5)
puts 'false' if world[0][0].player == false

player = create_player(world, 'Drew')
puts 'true' if world[0][0].player == true

puts 'player is:'
puts where_is_player(world)

move_player(world, player, 'n')
move_player(world, player, 'n')
move_player(world, player, 'e')
puts 'is old location player == true?'
puts 'false' if world[0][0].player == false

puts 'is new location player == true?'
puts 'true' if world[0][0].player == true

# To Do:

# weapon class 
#   weapon.hit
#   weapon.degrade
#   weapon.break

# item class

# location class
  # location.setup
    # have a hash of location types, a description, and a blocker/passage 
    # ie "cave", "a smelly, dank cave", and "a solid cave wall"/"a tunnel through"
    # for each direction 0-3 (NSEW) choose 0 for blocked 1 for passage, store
    # in a hash
    # location.describe


# Idea? Use "move" command to add 1, or - 1, to [X,Y] coordinate and move
# Then, on generate, use said [0,1] 'compass' to determine entry point
# location.paths will still be an array of 4 numbers, but "entry" will be determined
# by the 'compass' move array

# puts "Hello, welcome to the world."
# puts "Please, enter a command:"
# get_input(gets.chomp)
