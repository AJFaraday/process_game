require 'gosu'
require File.join(File.dirname(__FILE__), 'lib', 'background')
require File.join(File.dirname(__FILE__), 'lib', 'components', 'movement')
require File.join(File.dirname(__FILE__), 'lib', 'components', 'health')
require File.join(File.dirname(__FILE__), 'lib', 'unit')
require File.join(File.dirname(__FILE__), 'lib', 'spin')
require File.join(File.dirname(__FILE__), 'lib', 'z_order')

X_SIZE = 640
Y_SIZE = 480
TILE_SIZE = 60

class Game < Gosu::Window

  attr_accessor :drawable_objects
  attr_accessor :updatable_objects
  attr_accessor :animations

  def initialize
    super X_SIZE, Y_SIZE, {}
    self.caption = "Process Game"

    self.drawable_objects = []
    self.updatable_objects = []

    init_background
    init_animations
    init_player
  end

  def init_player
    unit = Unit.new(self)
    self.drawable_objects << unit
    self.updatable_objects << unit
  end

  def init_background
    background = Background.new
    drawable_objects << background
  end

  def init_animations
    # presented here as template for when I want a spin to happen
    animations = {}
    animations[:spin] = Gosu::Image::load_tiles(
      File.join(File.dirname(__FILE__), 'images','spin.png'),
      60,
      60
    )
  end

  def update
    updatable_objects.each { |ob| ob.update }
  end

  def draw
    drawable_objects.each { |ob| ob.draw }
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

end

window = Game.new
window.show
