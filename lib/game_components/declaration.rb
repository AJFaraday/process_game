module GameComponents
  # The big bit of text in the middle
  class Declaration

    attr_accessor :text
    attr_accessor :displaying

    def initialize(size)
      @displaying = false
    end

    def draw
      if @displaying
        @image.draw(
          (X_SIZE / 2) - (@image.width / 2),
          (Y_SIZE / 2) - (@image.height / 2),
          5
        )
      end
    end

    def update
      if @displaying and @stop_time < Gosu::milliseconds
        @displaying = false
      end
    end

    def show_text(text, ms)
      @text = text
      @stop_time = Gosu::milliseconds + ms
      @image = Gosu::Image.from_text(
        @text,
        Y_SIZE / 5,
        :width => Y_SIZE * 0.9,
        :align => :center
      )
      @displaying = true
    end

  end
end
