require_relative '../lib/game'

game = Game.new

faction = game.add_faction('blue','blue')

faction.add_unit('Farm', 100, 100)
faction.add_unit('Castle', 100, 220)


faction = game.add_faction('reds','red')

faction.add_unit('Farm', 540, 380)
#faction.add_unit('Castle', 540, 260)


game.show