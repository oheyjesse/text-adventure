require_relative "adventure/version"
require_relative "adventure/globals"
require_relative "adventure/entity"
require_relative "adventure/location"
require_relative "adventure/world"

require 'pry'

# I namespaced the game simply to gain more understanding of how modules/classes
# interact. I've since come to understand it's un-necessary for a standalone
# game like this. But this whole thing is a learning experiment for me, so...
module Adventure
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

  # Testing some location stuff
  test = Location.new([1,3])

  puts 'The ' + test.name.split(' ').map(&:capitalize).join(' ')
  puts 'You stand in a ' + test.description
  puts 'A ' + test.barrier + ' blocks your path. You can\'t go this way.' 
  puts ''

  # Testing some player stuff
  player = Entity.new('player','Drew',100,'axe','cherry pie')

  player.move('n')
  player.move('n')
  player.move('n')
  player.move('e')
  player.move('east')
  puts ''

  # Testing world stuff
  world = World.new(5)
  world.show
end
