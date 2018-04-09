# The engine class creates and stores all the game information such as the 
# world array (a 2d array populated by Locations), and the player. It will be
# responsible for game state and turn state, and provide helper functions

class Engine

  attr_reader :world, :player

  def initialize(worldsize, playername)

    @world = create_world(worldsize)
    @player = create_player(playername)
    @enemy_seeds = create_enemies(worldsize)

  end

  def start
    main_loop
  end

  def main_loop

    # much of this loop has moved to interface.rb, execute_command
    # turn-based system will eventually arrive, for player and monster actions
    # ideally, when this is implemented, a 'main loop' may not be necessary

    loop do
      print "#{@player.coords} ".colorize(:light_yellow)
      input = input_prompt('What would you like to do?')
      execute_command(get_command(input))
    end
  end

  def where_is_player
    @world[@player.coords[0]][@player.coords[1]]
  end

  def location(coordinates)
    @world[coordinates[0]][coordinates[1]]
  end

  # ---------------------------------------------- Private Methods
  private

  def create_world(size)
    # generates an Array(x) of Arrays(y) (the map)
    Array.new(size) { |x| Array.new(size) { |y| Location.new([x, y])} }
  end

  def create_player(name)
    @player = Player.new(name, @world.size)
  end
  
  # Uuuuuuugly. Please fix me :/
  def create_enemies(size)
    Data.enemy_seeds.each do |seed|
      count = 0
      while count < gen_enemy_numbers(size, seed[:init_percent])
        rand_coord = [rand(size), rand(size)] 
        if location(rand_coord).enemies.empty?
          location(rand_coord).enemies << Enemy.new(rand_coord, seed[:strength])
          seed[:coords] << rand_coord
          count += 1
        end
      end
      engine_msg(self, "World populated: #{seed[:strength]}: #{seed[:coords]}")
    end
  end

  def gen_enemy_numbers(worldsize, percentage)
    ((worldsize**2) * (percentage/100.0)).to_int
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