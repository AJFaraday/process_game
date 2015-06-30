module FactionComponents

  module InfoBar

    HEIGHT = 30

    def init_info_bar
      @display_x ||= 10
      @display_y ||= HEIGHT + (HEIGHT * index)
      @name_width = HEIGHT * 3
      @font = Gosu::Font.new(HEIGHT)
    end

    def draw_info_bar
      @font.draw(
        @name,
        @display_x,
        @display_y,
        5
      )
      draw_resources(@display_y)
    end

  end

end