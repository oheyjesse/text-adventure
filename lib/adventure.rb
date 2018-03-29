require_relative 'adventure/data'
require_relative 'adventure/models/entity'
require_relative 'adventure/models/location'
require_relative 'adventure/models/world'
require_relative 'adventure/controllers/engine'
require_relative 'adventure/views/interface'

require 'pry'

# I namespaced the game simply to gain more understanding of how modules/classes
# interact. I've since come to understand it's un-necessary for a standalone
# game like this. But this whole thing is a learning experiment for me, so...

world = create_world(5)

player = create_player(world, input_prompt('Please enter your name'))

story_intro(world, player)

loop do 
  command = input_prompt('What would you like to do?')
  case command
  when 'move', 'm'
    move_player(world, player, input_prompt('Which direction would you like to move in?'))
  when 'quit', 'q', 'exit', 'x'
    response = input_prompt('Are you sure you want to exit?')
    case response
    when 'yes', 'y'
      exit
    end
  else
    puts 'Invalid command'
  end

  puts "You stand in the #{player.location(world).name}"
  puts "What a #{player.location(world).descriptor}, #{player.location(world).description}"
end

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


# puts player.coordinates

# puts 'true' if world[0][0].player_present == true

# puts 'player is:'

# puts where_is_player(world)

# move_player(world, player, 'n')
# move_player(world, player, 'n')
# move_player(world, player, 'e')

# puts 'is old location player == true?'
# puts 'false' if world[0][0].player_present == false

# puts 'is new location player == true?'
# puts 'true' if world[2][1].player_present == true