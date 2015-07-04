require_relative '../lib/game'

game = Game.new

faction = game.add_faction('blue','blue')

faction.add_unit(:peasant, 100, 240)
faction.add_unit(:coward_peasant, 100, 340)

faction = game.add_faction('red','red')

faction.add_unit(:coward_peasant, 400, 240)
faction.add_unit(:peasant, 400, 340)

game.factions.each do |faction|
  faction.hide_info_bar = true
end


game.show