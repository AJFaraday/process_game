require_relative '../../lib/game'

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
  faction.add_unit(:peasant, rand(X_SIZE), rand(Y_SIZE))
  faction.add_unit(:coward_peasant, rand(X_SIZE), rand(Y_SIZE))
  faction.add_unit(:knight, rand(X_SIZE), rand(Y_SIZE))
  faction.add_unit(:bird, rand(X_SIZE), rand(Y_SIZE))
  faction.add_unit(:archer, rand(X_SIZE), rand(Y_SIZE))
  faction.add_unit(:monk, rand(X_SIZE), rand(Y_SIZE))
end

game.factions.each do |faction|
  faction.hide_info_bar = true
end


game.show