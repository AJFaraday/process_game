require_relative '../lib/game'

game = Game.new

faction = game.add_faction('blue','blue')
faction.add_unit(:monk, 540, 320)
faction.add_unit(:peasant, 540, 380)

faction = game.add_faction('red','red')
faction.add_unit(:monk, 100, 320)
faction.add_unit(:peasant, 100, 100)

game.factions.each do |faction|
  faction.hide_info_bar = true
end


game.show