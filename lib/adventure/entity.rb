# player class inherits from Entity class
# monster class inherits from entity class

#   entity.move(direction)
#   entity.attack(entity, weapon)
#   entity.droploot(location)
#   entity.pickup(loot)
#   entity.use(item)

module Adventure
  class Entity
    def initialize(type, name, health, weapon, items)
      @type = type
      @name = name
      @health = health
      @weapon = weapon
      @items = items
      @coordinates = [0,0] #rand(locations) function?
    end

    def look(thing) #(direction, location or entity)
      # look at the thing
      # return description
    end

    def parse_direction(direction)
      # takes direction as a string, compares it against COMPASS and 
      # returns corresponding direction modifier array
      dir_modifier = COMPASS[direction.to_sym]
      return dir_modifier
    end

    def update_coordinates(coordinates, dir_modifier)
      # zip direction modifiers into coordinates, and sum the result
      new_coordinates = @coordinates.zip(dir_modifier).map { |arr| arr.sum }
      return new_coordinates
    end

    def attempt_move(direction)
      # attempt to move in the direction
      # fail if the direction is blocked
      # move if you can
    end

    def move(direction)
      old_coordinates = @coordinates
      new_coordinates = update_coordinates(old_coordinates, parse_direction(direction))

      @coordinates = new_coordinates
      puts "You have moved from #{old_coordinates} to #{@coordinates}"
    end
  end
end