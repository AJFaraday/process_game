require_relative '../lib/game'

game = Game.new

game.add_faction('red',Gosu::Color::RED)
#game.add_faction('yellow',Gosu::Color::YELLOW)
game.add_faction('green',Gosu::Color::GREEN)
#game.add_faction('cyan',Gosu::Color::CYAN)
game.add_faction('blue',Gosu::Color::BLUE)

x = 0
y = 0
n = 0
until x > X_SIZE
  y = 0
  until y > Y_SIZE
    faction = game.factions[n % game.factions.length]
    n += 1
    faction.add_unit('AttackingUnit', x, y)
    y += 100
  end
  x += 100
end

game.show