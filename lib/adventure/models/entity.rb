# player class inherits from Entity class
# monster class inherits from entity class

#   entity.move(direction)
#   entity.attack(entity, weapon)
#   entity.droploot(location)
#   entity.pickup(loot)
#   entity.use(item)

class Entity

  attr_reader :name, :type, :health, :weapon, :items
  attr_accessor :coordinates

  def initialize(coordinates, type, playername, health, weapon, items)
    @type = type
    @name = playername
    @health = health
    @weapon = weapon
    @items = items
    @coordinates = coordinates # array of coordinates [x,y]


    # Location should not be here. "Location" does not belong to player. 
    # Location belongs to World. Consider using coordinates to refer to 
    # world, outside of this class. Maybe in main? or a new file called engine?

  end

  def look(thing) # object
    look = ''
    case thing
    when Location
      'you stand in the ' + thing.name + '.'
    when Entity
      "you see #{thing.name}. They're a #{thing.type}!"
    else
      "you can't see that thing."
    end
  end
    #(direction, location or entity)

  def location(world)
    world[@coordinates[0]][@coordinates[1]]
  end


  
  def attempt_move(direction)
    # attempt to move in the direction
    # fail if the direction is blocked
    # move if you can
  end
  
  def move(world, direction)
    old_coordinates = @coordinates
    new_coordinates = update_coordinates(old_coordinates, parse_direction(direction))
    
    world[old_coordinates[0]][old_coordinates[1]].player_present = false
    world[new_coordinates[0]][new_coordinates[1]].player_present = true
    
    @coordinates = new_coordinates
    puts "**Engine: (moved from #{old_coordinates} (#{world[old_coordinates[0]][old_coordinates[1]].name}) to #{@coordinates} (#{world[@coordinates[0]][@coordinates[1]].name}))"
    puts ''
  end
  
  # Look functions go here?
  
  private
  
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

end
