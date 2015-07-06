class Faction

  include FactionComponents::InfoBar
  include FactionComponents::Resources
  include FactionComponents::Units

  attr_accessor :game, :name, :colour
  attr_accessor :units, :index
  attr_accessor :hide_info_bar

  def initialize(name, colour, game, options={})
    @name = name
    @colour = colour
    @game = game
    @units = []
    @index = options[:index] || 0
    init_resources
    init_info_bar
  end

  def dead?
    # healing units don't count.
    self.units.reject{|x|x.is_a?(HealingUnit)}.none?
  end

  def alive?
    !dead?
  end

  def draw
    draw_info_bar unless hide_info_bar
  end

end