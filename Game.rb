class Game
  attr_accessor :player1, :player2, :current_player 

  def initialize(p1, p2)
    self.player1 = p1
    self.player2 = p2 
    self.current_player = p1
  end

  def question
    rand_num_one = rand(1..20)
    rand_num_two = rand(1..20)
    puts "#{self.current_player.name}: What does #{rand_num_one} plus #{rand_num_two} equal?"
    rand_num_one + rand_num_two
  end

  def current_score
    puts "P1: #{self.player1.current_lives}/#{self.player1.total_lives} vs P2: #{self.player2.current_lives}/#{self.player2.total_lives}"
  end

  def validate_answer(correct_answer, answer)
    if answer == correct_answer
      puts "#{self.current_player.name}: YES! You are correct."
      self.current_score
    else
      puts "#{self.current_player.name}: Seriously? No!"
      self.current_player.current_lives -= 1
      self.current_score
    end
  end

  def game_over(winner)
    puts "#{winner.name} wins with a score of #{winner.current_lives}/#{winner.total_lives}"
    puts "----- GAME OVER -----"
    puts "Good bye!"
    exit(0)
  end

  def new_turn
    if self.player1.current_lives == 0
      self.game_over(self.player2)
    elsif self.player2.current_lives == 0
      self.game_over(self.player1)
    else
      puts "----- NEW TURN -----"
      self.current_player == self.player1 ? self.current_player = self.player2 : self.current_player = self.player1
    end
  end

  def logic
    correct_answer = self.question
    answer = self.current_player.get_answer.to_i

    self.validate_answer(correct_answer, answer)
    self.new_turn
  end
end