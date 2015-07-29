module GameComponents
  module Lakes

    attr_accessor :lakes

    def init_lakes
      self.lakes = []
    end

    def add_lake(x,y, x_size, y_size)
      lake = Lake.new(x,y,x_size,y_size)
      self.lakes << lake
      self.drawable_objects << lake
    end

  end
end