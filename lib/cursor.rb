class Cursor

  include CommonComponents::RelativePositions

  IMAGE_PATH = File.join(File.dirname(__FILE__), "..", 'images', 'misc', 'cursor.png')

  attr_accessor :x, :y, :half_size

  def initialize(game)
    @game = game
    @image = Gosu::Image.new(IMAGE_PATH)
    @last_action_time = Gosu::milliseconds
    @half_size = 0
  end

  def update
    @x = @game.mouse_x
    @y = @game.mouse_y
    if @game.button_down?(Gosu::MsLeft) and @active
      @active = false
      # units_under_cursor.do_stuff
    end
    if !@game.button_down?(Gosu::MsLeft)
      @active = true
    end
  end

  def units_under_cursor
    @game.units.select { |x| distance_to(x) <= x.half_size }
  end

  def draw
    @image.draw(
      @x, @y, LAYERS[:ui]
    )
  end

end
