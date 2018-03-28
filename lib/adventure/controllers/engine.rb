# World generation

def create_world(size)
  # generates an Array(x) of Arrays(y) (the map)
  Array.new(size) { |x| Array.new(size) { |y| Location.new([x, y])} }
end

# Player & Monster creation

def create_player(world, name)
  player = Entity.new('player', name ,100 ,'axe' ,'cherry pie')
  world[player.coordinates[0]][player.coordinates[1]].player = true
end

# Entity Move functions

def where_is_player(world)
  found_location = nil
  world.each do |x_coord|
    x_coord.each do |y_coord|
      found_location = y_coord if y_coord.player == true
    end
  end
  found_location.coordinates
end

def parse_direction(direction)
  # takes direction as a string, compares it against COMPASS and 
  # returns corresponding direction modifier array
  dir_modifier = COMPASS[direction.to_sym]
  return dir_modifier
end

def update_coordinates(coordinates, dir_modifier)
  # zip direction modifiers into coordinates, and sum the result
  new_coordinates = coordinates.zip(dir_modifier).map { |arr| arr.sum }
  return new_coordinates
end

def attempt_move(direction)
  # attempt to move in the direction
  # fail if the direction is blocked
  # move if you can
end



def move_player(world, player, direction)
  old_coordinates = player.coordinates
  player.coordinates = update_coordinates(old_coordinates, parse_direction(direction))

  world[old_coordinates[0],old_coordinates[1]].player = false
  world[player.coordinates[0],player.coordinates[1]].player = true

  puts "You have moved from #{old_coordinates} to #{player.coordinates}"
end

def move_entity(entity, coordinates)

end
# Look functions go here?

def look(thing) # object
  look = 'no'
  case thing
  when Adventure::Location
    'you stand in the ' + thing.name + '.'
  when Adventure::Entity
    "you see #{thing.name}. They're a #{thing.type}!"
  else
    "you can't see that thing."
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