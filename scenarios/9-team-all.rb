require_relative '../lib/game'

game = Game.new

game.add_faction('red','red')
game.add_faction('yellow','yellow')
game.add_faction('green','green')
game.add_faction('teal','teal')
game.add_faction('blue','blue')
game.add_faction('purple','purple')

game.add_faction('grey','grey')
game.add_faction('white','white')
game.add_faction('black','black')

game.factions.each do |faction|
  faction.hide_info_bar = true
  x = rand(X_SIZE)
  faction.add_unit(:peasant, x, rand(Y_SIZE))
  faction.add_unit(:coward_peasant, x, rand(Y_SIZE))
  faction.add_unit(:knight, x, rand(Y_SIZE))
  faction.add_unit(:archer, x, rand(Y_SIZE))
  faction.add_unit(:monk, x, rand(Y_SIZE))
  faction.add_unit(:flag, x, rand(Y_SIZE))
end

game.show