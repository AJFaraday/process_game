require_relative '../../lib/game'

game = Game.new


game.add_unit(:archer, 100, 100)
game.add_unit(:knight, 100, 300)

game.show