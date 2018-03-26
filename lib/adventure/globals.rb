module Adventure
  # Direction header. N, S, E, W. Used for determining entry point to locationx
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
end