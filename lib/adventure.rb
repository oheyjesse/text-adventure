require_relative 'adventure/data'
require_relative 'adventure/models/entity'
require_relative 'adventure/models/location'
require_relative 'adventure/models/world'
require_relative 'adventure/controllers/engine'
require_relative 'adventure/controllers/interface'

require 'pry'

playername = input_prompt('Please enter your name')
game = Engine.new(5, playername)
story_intro(game.world, game.player)

# *trumpets blare in the distance*
game.start





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
# by the 'compass' move array?