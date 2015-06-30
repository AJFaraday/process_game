require_relative '../lib/game'

game = Game.new

faction = game.add_faction('blue','blue')

faction.add_unit(:archer, 100, 100)

faction = game.add_faction('red','red')


faction.add_unit(:knight, 100, 300)


game.show