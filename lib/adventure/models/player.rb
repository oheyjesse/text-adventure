# Player inherits from the Entity class, and acts as the player-driven hero. It
# is initialized mostly with set attributes, save for it's name. It's coords are
# set to the middle of the map size, whatever that may be.

class Player < Entity
  attr_reader :name, :health, :weapon, :items
  
  def initialize(name, worldsize)
    @name = name
    @health = 40

    # TODO: replace weapons with objects from items/weapons class
    @weapon = { name: 'axe',
                damage: 5 }
    @items = 'a... dodger blue handkerchief..?'

    @coords = starting_location(worldsize) # array of coords [x,y]
  end

  # ---------------------------------------------- Private Methods
  private
  def starting_location(worldsize)
    [worldsize/2,worldsize/2]
  end
end


