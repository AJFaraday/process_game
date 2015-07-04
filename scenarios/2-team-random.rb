require_relative '../lib/game'

def fill_faction(faction)
  2.times do
    faction.add_unit(:peasant,rand(X_SIZE),rand(Y_SIZE))
    faction.add_unit(:knight,rand(X_SIZE),rand(Y_SIZE))
  end
end

game = Game.new

faction = game.add_faction('blue', 'blue')
fill_faction(faction)

faction = game.add_faction('red', 'red')
fill_faction(faction)


game.factions.each do |faction|
  faction.hide_info_bar = true
end


game.show