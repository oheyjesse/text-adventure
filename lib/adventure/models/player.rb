# Player inherits from the Entity class, and acts as the player-driven hero. It
# is initialized mostly with set attributes, save for it's name. It's coords are
# set to the middle of the map size, whatever that may be.

class Player < Entity

  def initialize(playername, worldsize)
    @player_name = playername
    @health = 25
    @weapon = 'axe'
    @items = 'a... dodger blue handkerchief..?'
    @coords = starting_location(worldsize) # array of coords [x,y]
  end

  # ---------------------------------------------- Private Methods
  private
  def starting_location(worldsize)
    [worldsize/2,worldsize/2]
  end
end


