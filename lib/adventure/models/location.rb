# At this stage, this class is essentially a model for each location. It may well
# eventually contain enemies and items, but that will depend on design choices
# going forward.
# As yet not implemented: "barriers" to block certain entries/exits, to make the
# game more maze-like. Future feature.

class Location

  attr_reader :place, :coords, :entry_point, :name, :descriptor, :description, :barrier, :entities, :exits
  attr_accessor :player_present

  def initialize(coords)
    @place = LOCATION_INDEX.sample

    @coords = coords
    @descriptor = DESCRIPTORS.sample
    @name = @descriptor + ' ' + @place[:name]
    @description = @place[:description]
    @barrier = @place[:barrier]
    @items = []
    @entities = []
    @player_present = false

    # not yet implemented: exit points
    @entry_point = 'nothing yet'
  end

  # not yet implemented. Want to eventually have random generated exits from every location
  def generate_exits
    @exits = []
    while @exits.sum < 2 
      @exits = [rand(0..1),rand(0..1),rand(0..1),rand(0..1)]
      @exits[@entry_point] = 1
    end
  end

end
