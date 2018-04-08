# The engine class creates and stores all the game information such as the 
# world array (a 2d array populated by Locations), and the player. It will be
# responsible for game state and turn state, and provide helper functions

class Engine

  attr_reader :world, :player

  def initialize(worldsize, playername)

    @world = create_world(worldsize)
    @player = create_player(playername)

  end

  def start
    main_loop
  end

  def main_loop

    # big ugly proof of concept loop:
    # break into parts:
    # interface will take input, strip, split words into array
    # interface will iterate through array to determine player decision

    # turn-based system will eventually arrive, for player and monster actions
    # ideally, when this is implemented, a 'main loop' may not be necessary

    loop do
      print "[#{player.coords[0]}, #{player.coords[1]}] ".colorize(:light_yellow)
      input = input_prompt('What would you like to do?')
      execute_command(get_command(input))
    end

    # loop do 
    #   print "[#{player.coords[0]}, #{player.coords[1]}] ".colorize(:light_yellow)
    #   command = input_prompt('What would you like to do?')
    #   case command
    #   when 'move', 'm'
    #     direction = input_prompt('Which direction would you like to move in?')
    #     compasspoints = COMPASS.keys
    #     case direction.to_sym
    #     when *compasspoints
    #       player.move(@world, direction)
    #     else
    #       puts "...That's not a direction. Try N S E W.".colorize(:light_red)
    #       puts ''
    #     end

    #   when 'look', 'l'
    #     engine_msg(self, player.look_at(player.location_in(world)).to_s)

    #   when 'quit', 'q', 'exit', 'x'
    #     # response = input_prompt('Are you sure you want to exit?')
    #     # case response
    #     # when 'yes', 'y'
    #       exit
    #     # end
    #   else
    #     puts 'I\'m quite sure I don\'t understand.'.colorize(:light_red)
    #     puts ''
    #   end
    
    #   puts "You stand in a #{player.location_in(world).descriptor}, #{player.location_in(world).description}"
    #   puts ''
    # end
  end

  
  def where_is_player()
    found_location = nil
    @world.each do |x|
      x.each do |y|
        found_location = y if y.coords == @player.coords
      end
    end
    found_location
  end
  
  private
  
  # World generation
  def create_world(size)
    # generates an Array(x) of Arrays(y) (the map)
    Array.new(size) { |x| Array.new(size) { |y| Location.new([x, y])} }
  end
  
  # Player creation
  
  def create_player(name)
    @player = Player.new(name, @world.size)
  end

end



# # Testing some location stuff
# test = Location.new([1,3])

# puts 'The ' + test.name.split(' ').map(&:capitalize).join(' ')
# puts 'You stand in a ' + test.description
# puts 'A ' + test.barrier + ' blocks your path. You can\'t go this way.' 
# puts ''

# # Testing world stuff
# world = World.new(5)
# world.show

# # Testing some player stuff
# player = Entity.new(world, 'player', 'Drew' ,100 ,'axe' ,'cherry pie')

# puts player.look(player.location)
# player.move('n')
# puts player.look(player.location) # problems with move
# player.move('n')
# player.move('n')
# player.move('e')
# puts player.look(player.location)
# player.move('east')
# puts ''

# puts 'testing look function'
# puts player.look(player.location)