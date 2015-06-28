require_relative '../lib/game'

game = Game.new

faction = game.add_faction('blue','blue')

faction.add_unit('AttackingUnit', 540, 100)
faction.add_unit('AttackingUnit', 540, 380)

faction = game.add_faction('reds','red')

faction.add_unit('AttackingUnit', 100, 380)
faction.add_unit('AttackingUnit', 100, 100)

game.show