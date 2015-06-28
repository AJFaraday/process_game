module GameComponents

  module ActionFrames

    attr_accessor :frame

    def resource_frame?
      @frame % 60 == 0
    end

    def spawn_frame?
      @frame % 60 == 0
    end

  end

end
