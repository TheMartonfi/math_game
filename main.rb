require "./Player"
require "./Game"

player1 = Player.new("Player 1", 3)
player2 = Player.new("Player 2", 3)
game = Game.new(player1, player2)

while true
  game.logic
end

# Hello from WSL
