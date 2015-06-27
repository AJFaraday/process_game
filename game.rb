require 'gosu'
require File.join(File.dirname(__FILE__), 'lib', 'background')
require File.join(File.dirname(__FILE__), 'lib', 'components', 'movement')
require File.join(File.dirname(__FILE__), 'lib', 'unit')
require File.join(File.dirname(__FILE__), 'lib', 'spin')
require File.join(File.dirname(__FILE__), 'lib', 'z_order')

X_SIZE = 640
Y_SIZE = 480
TILE_SIZE = 60

class Game < Gosu::Window

  attr_accessor :background
  attr_accessor :drawable_objects
  attr_accessor :updatable_objects
  attr_accessor :spinners

  def initialize
    super X_SIZE, Y_SIZE, {}
    self.caption = "Process Game"

    self.drawable_objects = []
    self.updatable_objects = []

    self.background = Background.new
    self.drawable_objects << self.background

    unit = Unit.new(self)
    self.drawable_objects << unit
    self.updatable_objects << unit

    self.spinners = []
    get_animations
  end

  def get_animations
    @spin_anim = Gosu::Image::load_tiles(
      File.join(File.dirname(__FILE__), 'images','spin.png'),
      60,
      60
    )
  end

  def update
    updatable_objects.each { |ob| ob.update }
    create_spinners
  end

  def draw
    drawable_objects.each { |ob| ob.draw }
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

  def create_spinners
    if rand(100) < 1 and @spinners.size < 25
      puts 'creating spinner'
      spinner = Spin.new(@spin_anim)
      drawable_objects.push(spinner)
      @spinners.push(spinner)
    end
  end

end

window = Game.new
window.show
