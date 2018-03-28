# player class inherits from Entity class
# monster class inherits from entity class

#   entity.move(direction)
#   entity.attack(entity, weapon)
#   entity.droploot(location)
#   entity.pickup(loot)
#   entity.use(item)

class Entity

  attr_reader :name, :type, :health, :weapon, :items, :location, :coordinates

  def initialize(type, name, health, weapon, items)
    @type = type
    @name = name
    @health = health
    @weapon = weapon
    @items = items
    @coordinates = [0,0] #rand(locations) function?

    # Location should not be here. "Location" does not belong to player. 
    # Location belongs to World. Consider using coordinates to refer to 
    # world, outside of this class. Maybe in main? or a new file called engine?

  end

  def look(thing) # object
    look = 'no'
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

end
