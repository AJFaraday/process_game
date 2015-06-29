class Faction

  include FactionComponents::InfoBar
  include FactionComponents::Resources

  attr_accessor :game, :name, :colour
  attr_accessor :units, :index

  def initialize(name, colour, game, options={})
    @name = name
    @colour = colour
    @game = game
    @units = []
    @index = options[:index] || 0
    init_resources
    init_info_bar
  end

  def add_unit(kls, x, y, options={})
    options = ActiveSupport::HashWithIndifferentAccess.new(options)
    if kls.is_a?(Symbol)
      opts = game.unit_classes[kls]
      options.merge!(opts)
      kls = Object.const_get(opts[:class])
    else
      kls = Object.const_get(kls)
    end
    options.merge!({:faction => self, :colour => colour})
    unit = kls.send(:new, x, y, game, options)
    self.units << unit
    unit
  end

  def dead?
    self.units.none?
  end

  def alive?
    !dead?
  end

  def draw
    draw_info_bar
  end

end