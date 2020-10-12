class Player
  attr_accessor :name, :current_lives, :total_lives

  def initialize(n, l)
    self.name = n
    self.current_lives = l
    self.total_lives = self.current_lives
  end

  def get_answer
    print "> "
    $stdin.gets.chomp
  end
end