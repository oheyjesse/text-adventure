# At this stage, this class is essentially a model for each location. It may well
# eventually contain enemies and items, but that will depend on design choices
# going forward.
# As yet not implemented: "barriers" to block certain entries/exits, to make the
# game more maze-like. Future feature.

class Location

  attr_reader :descriptor, :simple_name, :full_name, :description, :barrier,
              :enemies, :exits, :coords, :entry_point

  def initialize(coords)
    place = Data.location
    descriptor = Data.location_descriptor

    @descriptor = descriptor
    @simple_name = place[:name]
    @full_name = descriptor + ' ' + place[:name]
    @description = place[:description]
    @barrier = place[:barrier]
    
    @coords = coords
    @items = []
    @enemies = []
    

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
