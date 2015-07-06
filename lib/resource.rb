class Resource

  IMAGE_DIRECTORY = File.join(File.dirname(__FILE__), "..", 'images', 'resources')
  TILE_SIZE = 30

  include CommonComponents::Avatar

  attr_accessor :amount
  attr_accessor :name
  attr_accessor :faction
  attr_accessor :building_index

  def initialize(name)
    @name = name
    init_avatar(:avatar => name)
    @amount = 0
    @font = Gosu::Font.new(TILE_SIZE)
    @building_index = 0
  end

  def draw(x, y)
    @avatar.draw(
      x,
      y,
      LAYERS[:ui],
      0.5,
      0.5
    )
    @font.draw(
      @amount,
      x + TILE_SIZE,
      y,
      LAYERS[:ui]
    )
  end

  def next_building
    if buildings.any?
      buildings[building_index % buildings.size]
    end
  end

  def buildings
    faction.buildings.select do |building|
      building.is_a?(SpawnBuilding) and
        building.resource == self
    end
  end


end