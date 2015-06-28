require_relative '../lib/game'

game = Game.new

game.init_unit('AttackingUnit', 100, 100)
game.init_unit('AttackingUnit', 540, 100)
game.init_unit('AttackingUnit', 540, 380)
game.init_unit('AttackingUnit', 100, 380)

game.show