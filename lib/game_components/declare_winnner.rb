module GameComponents

  module DeclareWinner

    def check_for_winner
      if @active
        if factions and factions.select { |x| x.alive? }.count == 1
          declare_winner(factions.select { |x| x.alive? }[0])
        elsif units.count == 1
          declare_winner(units.first)
        end
      end
    end

    def declare_winner(winner)
      @declaration.show_text(
        "#{winner.name} wins!",
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