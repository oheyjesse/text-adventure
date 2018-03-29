class Location

  attr_reader :place, :coordinates, :entry_point, :name, :descriptor, :description, :barrier, :entities, :exits
  attr_accessor :player_present

  def initialize(coordinates)
    @place = LOCATION_INDEX.sample

    @coordinates = coordinates
    @descriptor = DESCRIPTORS.sample
    @name = @descriptor + ' ' + @place[:name]
    @description = @descriptor + ', ' + @place[:description]
    @barrier = @place[:barrier]
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
