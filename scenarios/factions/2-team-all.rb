require_relative '../../lib/game'

game = Game.new

game.add_faction('red','red')
game.add_faction('blue','blue')

game.factions.each do |faction|
  x = rand(X_SIZE)
  faction.add_unit(:peasant, x, rand(Y_SIZE))
  faction.add_unit(:coward_peasant, x, rand(Y_SIZE))
  faction.add_unit(:knight, x, rand(Y_SIZE))
  faction.add_unit(:archer, x, rand(Y_SIZE))
  faction.add_unit(:monk, x, rand(Y_SIZE))
  faction.add_unit(:flag, x, rand(Y_SIZE))
end

game.show