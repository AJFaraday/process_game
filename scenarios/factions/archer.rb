require_relative '../../lib/game'

game = Game.new

game.add_faction('blue','blue')
game.add_faction('red','red')
game.add_faction('green','green')
game.add_faction('yellow','yellow')

game.factions.each do |faction|
  4.times{ faction.add_unit(:archer, rand(X_SIZE), rand(Y_SIZE)) }
end

game.factions.each do |faction|
  faction.hide_info_bar = true
end


game.show