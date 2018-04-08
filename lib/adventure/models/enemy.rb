class Enemy < Entity

  def initialize(coords, strength)
    enemy = Data.enemy
    descriptor = Data.enemy_descriptor

    @descriptor = descriptor
    @simple_name = enemy[:name]
    @full_name = descriptor + ' ' + enemy[:name]
    @description = enemy[:description]
    @noise = enemy[:noise]

    @weapon = enemy[:weapon]
    @weapon_damage = 3 * strength # TODO: Replace with weapon class
    @items = []

    @strength = strength
    @health = 10 * strength
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