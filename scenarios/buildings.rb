require_relative '../lib/game'

game = Game.new

faction = game.add_faction('blue','blue')

faction.add_unit('Farm', 100, 100)

faction = game.add_faction('reds','red')

faction.add_unit('Farm', 540, 380)

game.show