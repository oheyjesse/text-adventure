# Entity class: Main class for players and enemies. Using OO principles and 
# trying to keep it reasonably self-contained where possible. Has it's own
# co-ordinates to relate to the world map, has it's own health, items, weapons
# and will implement it's own status, movement, and inventory management 
# independently

# NYI: player class inherits from Entity class
# NYI: monster class inherits from entity class

#   entity.move(direction)
#   entity.attack(entity, weapon)
#   entity.droploot(location)
#   entity.pickup(loot)
#   entity.use(item)

class Entity

  attr_reader :name, :type, :health, :weapon, :items
  attr_accessor :coords

  def initialize(coords, type, playername, health, weapon, items)
    @type = type
    @name = playername
    @health = health
    @weapon = weapon
    @items = items
    @coords = coords # array of coords [x,y]

    # Location should not be here. "Location" does not belong to player. 
    # Location belongs to World. Consider using coords to refer to 
    # world, outside of this class. Maybe in main? or a new file called engine?
  end

  def move(world, direction)
    old_coords = @coords
    new_coords = update_coords(old_coords, parse_direction(direction))

    if validate_move(world, new_coords)
      @coords = new_coords

      world[old_coords[0]][old_coords[1]].player_present = false
      world[new_coords[0]][new_coords[1]].player_present = true

      engine_msg(self, "moved from #{old_coords} (#{world[old_coords[0]][old_coords[1]].name}) to #{@coords} (#{world[@coords[0]][@coords[1]].name})")
    else
      puts "The way is blocked. You can't go that way.".colorize(:light_red)
      puts ''
    end
  end

  def attack(enemy)
    # attacks with currently assigned weapon
  end

  def defend(weapon)
    # defends against attacks from enemies, 
    # and lowers health accordingly (entity.health_lower)
  end

  def pick_up(item)
    # removes item from where it resides
    # places item in entity's inventory
  end

  def drop(item)
    # removes item from entity's inventory
    # places item in entity.location's inventory
  end

  def use(item)
    # determines item type
    # passes item to correct method (equip, use_healthpack etc)
  end

  
  #(direction, location or entity)
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

  def location(world)
    world[@coords[0]][@coords[1]]
  end

  # ---------------------------------------------- Private Methods
  private

  def parse_direction(direction)
    # takes direction as a string, compares it against COMPASS and 
    # returns corresponding direction modifier array
    COMPASS[direction.to_sym]
  end

  def update_coords(coords, dir_modifier)
    # zip direction modifiers into coords, and sum the result
    new_coords = coords.zip(dir_modifier).map { |arr| arr.sum }
    return new_coords
  end
  
  # not yet fully implemented
  def validate_move(world, new_coords)
    true if new_coords[0].between?(0, world.size-1) && new_coords[1].between?(0, world.size-1)
  end
  
  def equip_weapon(weapon)
    # places weapon into inventory
    # equips weapon to current slot
  end
  
  def use_health(item)
    # increases health (entity.health_raise)
    # destroys item
  end
end
