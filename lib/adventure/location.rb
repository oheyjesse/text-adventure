module Adventure
  class Location

    attr_reader :coordinates, :entry_point, :name, :description, :barrier, :exits

    def initialize(coordinates)
      @location_index = LOCATION_INDEX.sample

      @coordinates = coordinates
      @descriptor = DESCRIPTORS.sample
      @name = @descriptor + ' ' + @location_index[:name]
      @description = @descriptor + ', ' + @location_index[:description]
      @barrier = location_index[:barrier]

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
end