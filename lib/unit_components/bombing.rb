module UnitComponents

  module Bombing

    def init_bombs(options)
      @bomb = options[:bomb]
      @bomb_damage = options[:bomb_damage]
      @bomb_cost = options[:bomb_cost]
      @bomb_time = options[:bomb_time]
      @bomb_range = options[:bomb_range]
    end

    def drop_bomb
      use_ability(@bomb_cost) do
        @game.add_bomb(@bomb, self, @bomb_damage, @bomb_time, @bomb_range)
      end
    end

    def can_drop_bomb?
      @ability_points >= @bomb_cost
    end

  end

end