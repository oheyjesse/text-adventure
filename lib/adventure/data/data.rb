require 'json'

VERSION = 0.3

# Direction header. N, S, E, W. Used for determining entry point to location
COMPASS = { n: [1,0],
  s: [-1,0],
  e: [0,1],
  w: [0,-1],
  north: [1,0],
  south: [-1,0],
  east: [0,1],
  west: [0,-1],
}.freeze

DESCRIPTORS = ['harsh', 'pitiful', 'gloomy', 'stinky', 'damp'].freeze

LOCATION_INDEX = [
  { name: 'desert', 
    description: 'barren desert. The sand stings your eyes with the wind.',
    barrier: 'huge lake of quicksand' 
  },
  { name: 'cave', 
    description: 'dank cave. The air in here is stale, and you can\'t help but feel claustrophobic.',
    barrier: 'wet, slimy cave wall'
  },
  { name: 'field', 
    description: 'open field. It\'s too quiet, and the air is too still. The hair pricks up on the back of your neck.',
    barrier: 'high, barbed-wire fence'
  },
].freeze

class Data

  jsonfile = File.read('adventure/data/gamedata.json')
  @data = JSON.parse(jsonfile)
  class << self
    def loc_descriptor
      @data[:location_descriptors].sample
    end

    def loc_descriptors
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

    def story_intro(world, player)
      puts "....#{player.name}."
      sleep(0.5)
      puts "..."
      sleep(0.5)
      puts "..."
      sleep(0.5)
      puts "..."
      sleep(1)
      puts ".......#{player.name.capitalize}."
      sleep(0.5)
      puts "..."
      sleep(0.5)
      puts "..."
      sleep(0.5)
      puts "..."
      sleep(1)
      puts ".......#{player.name.upcase}!"
      sleep(1)
      puts ''
      puts "Finally, you wake. Your head throbs, and your mouth is dry. Where are you?"
      sleep(0.5)
      puts ''
      puts "You look around."
      sleep(0.5)
      puts ''
      puts "You get a sense of your surroundings. You seem to be in the middle of some kind of #{player.location_in(world).place[:name]}."
      puts "It's quite #{player.location_in(world).descriptor}. It's not pleasant at all."
      puts ''
      engine_msg(self, "TEST RELEASE V(#{VERSION}). Only commands available are MOVE (compass direction), LOOK. :)")
    end
    
    def story_intro_quick(world, player)
      puts "....#{player.name}."  
      puts "..."  
      puts "..."  
      puts "..."
      puts ".......#{player.name.capitalize}."  
      puts "..."
      puts "..."
      puts "..."
      puts ".......#{player.name.upcase}!"
      puts ''
      puts "Finally, you wake. Your head throbs, and your mouth is dry. Where are you?"
      puts ''
      puts "You look around."
      puts ''
      puts "You get a sense of your surroundings. You seem to be in the middle of some kind of #{player.location_in(world).place[:name]}."
      puts "It's quite #{player.location_in(world).descriptor}. It's not pleasant at all."
      puts ''
      engine_msg(self, "TEST RELEASE V(#{VERSION}). Only commands available are MOVE (compass direction), LOOK. :)")
    end

    def json_write(data, filename)
      File.open("#{filename}.json","w") do |f|
        f.write(JSON.pretty_generate(data))
      end
    end
  end # class << self  

end