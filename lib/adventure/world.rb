module Adventure
  class World

    attr_reader :size, :worldmap 

    def initialize(size)

      @size = size
      @worldmap = draw # private class method- populates the world with locations

    end

    def show
      @worldmap.each_with_index do |column, index|
        puts "World column #{index}:"
        column.each do |row|
          puts row.name
        end
        puts '-' * 20
      end
    end

    private
    def draw
      # generates an Array(x) of Arrays(y) (the map)
      Array.new(@size) { |x| Array.new(@size) { |y| Location.new([x, y])} }
    end

  end
end