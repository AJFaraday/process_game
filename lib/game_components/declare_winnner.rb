module GameComponents

  module DeclareWinner

    def check_for_winner
      if @active
        if factions.select{|x|x.alive?}.count == 1
          declare_winner
        end
      end
    end

    def declare_winner
      winner = factions.select{|x|x.alive?}[0]
      @declaration.show_text(
        "#{winner.name} win!",
        10000
      )
      @active = false
      @close_time = Gosu::milliseconds + 10000
    end

    def close_after_time
      if !@active and @close_time < Gosu::milliseconds
        close
      end
    end

  end

end

