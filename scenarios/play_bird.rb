require_relative '../lib/game'

game = Game.new

game.add_unit(:player_bird, 100, 100)
game.add_unit(:castle, 540, 380)

game.show