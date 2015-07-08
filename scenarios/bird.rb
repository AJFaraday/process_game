require_relative '../lib/game'

game = Game.new

game.add_unit(:player_bird, 540, 100)
game.add_unit(:flag, 540, 380)

game.show