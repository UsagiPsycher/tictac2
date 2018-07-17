class Player
  attr_accessor :mark, :name

  def initialize(mark, name) 
    @mark = mark
    @name = name
  end

  def name
    @name
  end

  def move(board, position, engine) 
    board.positions_with_values[position] = self.mark
    board.display
    winner = engine.check_winner(board)
    if winner != "No One"
      engine.display_winner(self.name)
    end
  end


end
