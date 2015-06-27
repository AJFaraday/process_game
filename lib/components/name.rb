module Components

  module Name

    FIRST_NAMES = %w{ James John Robert Micheal William }

    SURNAMES = %w{Smith Johnson Williams Brown Jones}

    attr_accessor(:name)

    def init_name
      name
      @font = Gosu::Font.new(@bar_size * 2)
    end

    def name
      @name ||= generate_name
    end

    def generate_name
      first = FIRST_NAMES[rand(FIRST_NAMES.length)]
      last = SURNAMES[rand(SURNAMES.length)]
      "#{first} #{last}"
    end

    def draw_name
      @font.draw(
        name,
        x - @half_size,
        y - @half_size - (@bar_size * 4),
        2
      )
    end

  end

end