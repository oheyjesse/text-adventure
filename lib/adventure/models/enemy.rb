class Enemy < Entity
  attr_reader :simple_name, :full_name, :description, :noise, :movement,
              :weapon, :items, :strength
  attr_accessor :health, :hostile

  def initialize(coords, strength)
    enemy = Data.enemy
    descriptor = Data.enemy_descriptor

    @descriptor = descriptor
    @simple_name = enemy[:name]
    @full_name = descriptor + ' ' + enemy[:name]
    @description = enemy[:description]
    @noise = enemy[:noise]
    @movement = enemy[:movement]

    # TODO: replace weapons with objects from items/weapons class
    @weapon = { name: enemy[:weapon],
                damage: 3 }
    @items = []

    @strength = strength
    @health = 10 * strength
    @hostile = false
    @coords = coords # array of coords [x,y]
  end

  def strength_descriptor
    case @strength
    when 1
      'weak'
    when 2
      'tough'
    when 3
      'dangerous'
    end
  end

  def describe
    "Name: #{@full_name}.\nCoordinates: #{@coords}.\nNoise: #{@noise}.\nWeapon: #{@weapon}\nStrength: #{strength_descriptor} (#{@strength}).\nHealth: #{@health}"
  end

  # ---------------------------------------------- Private Methods
  private

end