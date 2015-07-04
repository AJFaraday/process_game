require_relative '../lib/game'

game = Game.new

faction = game.add_faction('teal','teal')

faction.add_unit(:peasant, 540, 100)
faction.add_unit(:peasant, 540, 380)

faction = game.add_faction('red','red')

faction.add_unit(:peasant, 100, 380)
faction.add_unit(:peasant, 100, 100)

game.factions.each do |faction|
  faction.hide_info_bar = true
end


game.show