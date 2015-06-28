module FactionComponents

  module InfoBar

    HEIGHT = 30

    def init_info_bar
      @display_x ||= 10
      @display_y ||= 10 - (HEIGHT * index)
      @name_width = HEIGHT * 32
      @name_display = Gosu::Image.from_text(
        @name,
        HEIGHT,
        :width => @name_width,
        :align => :left
      )
    end

    def draw_info_bar
      @name_display.draw(
        @display_x,
        @display_y,
        5
      )
    end

  end

end