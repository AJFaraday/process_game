require_relative '../lib/game'

game = Game.new

faction = game.add_faction('blue','blue')

faction.add_unit(:archer, 100, 100)

faction = game.add_faction('reds','red')


faction.add_unit(:archer, 500, 300)


game.show