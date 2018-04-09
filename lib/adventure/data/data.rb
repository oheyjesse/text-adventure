require 'json'

VERSION = 0.4

# Direction header. N, S, E, W. Used for determining entry point to location
COMPASS = { 
  n: [1,0],
  s: [-1,0],
  e: [0,1],
  w: [0,-1],
  north: [1,0],
  south: [-1,0],
  east: [0,1],
  west: [0,-1],
}.freeze

class Data
  # attr_reader :enemy_seed
  
  # [weak, tough, dangerous]
  # @enemy_seeds = [
  #   {
  #     strength: 1,
  #     init_percent: 50,
  #     coords: []
  #   },
  #   {
  #     strength: 2,
  #     init_percent: 25,
  #     coords: []
  #   },
  #   {
  #     strength: 3,
  #     init_percent: 10,
  #     coords: []
  #   }]

  jsonfile = File.read('adventure/data/gamedata.json')
  @data = JSON.parse(jsonfile, symbolize_names: true)

  class << self
    def location_descriptor
      @data[:location_descriptors].sample
    end

    def location_descriptors
      @data[:location_descriptors]
    end

    def location
      @data[:location_index].sample
    end

    def locations
      @data[:location_index]
    end

    def enemy_descriptor
      @data[:enemy_descriptors].sample
    end

    def enemy_descriptors
      @data[:enemy_descriptors]
    end

    def enemy
      @data[:enemy_index].sample
    end

    def enemies
      @data[:enemies_index]
    end

    def enemy_seeds
      @data[:enemy_seeds]
    end

    def story_intro(world, player, speed=1)
      puts "....#{player.name}."
      sleep(0.5 * speed)
      puts "..."
      sleep(0.5 * speed)
      puts "..."
      sleep(0.5 * speed)
      puts "..."
      sleep(1 * speed)
      puts ".......#{player.name.capitalize}."
      sleep(0.5 * speed)
      puts "..."
      sleep(0.5 * speed)
      puts "..."
      sleep(0.5 * speed)
      puts "..."
      sleep(1 * speed)
      puts ".......#{player.name.upcase}!"
      sleep(1 * speed)
      puts ''
      puts 'Finally, you wake. Your head throbs, and your mouth is dry. Where are you?'
      sleep(0.5 * speed)
      puts ''
      puts 'You look around.'
      sleep(0.5 * speed)
      puts ''
      puts "You get a sense of your surroundings. You seem to be in the middle of some kind of #{player.location_in(world).simple_name}."
      puts "It's quite #{player.location_in(world).descriptor}. It's not pleasant at all."
      puts ''
      engine_msg(self, "DEV (#{VERSION}). Only commands available are MOVE (compass direction), LOOK. :)")
    end

    def json_write(data, filename)
      File.open("#{filename}.json","w") do |f|
        f.write(JSON.pretty_generate(data))
      end
    end
  end # class << self  

end