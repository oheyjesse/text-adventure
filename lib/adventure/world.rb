module Adventure
  class World

    def initialize(size)
      
      start_coordinates = [[0][0]]
      
      @size = size
      @worldmap = [[]]

    end


    def generate
      # generates the map using procedural stuff
      puts 'generating world...'
      @worldmap = Array.new(@size) { |x| Array.new(@size) { |y| Location.new([x, y])} }
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

  end
end