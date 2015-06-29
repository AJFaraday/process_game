require_relative '../lib/game'

game = Game.new

game.add_faction('red','red')
game.add_faction('yellow','yellow')
game.add_faction('green','green')
game.add_faction('teal','teal')
game.add_faction('blue','blue')
game.add_faction('purple','purple')

game.add_faction('grey','grey')
game.add_faction('white','white')
game.add_faction('black','black')



x = 0
y = 0
n = 0
until x > X_SIZE
  y = 0
  until y > Y_SIZE
    faction = game.factions[n % game.factions.length]
    n += 1
    faction.add_unit(:peasant, x, y)
    y += 60
  end
  x += 60
end

game.show