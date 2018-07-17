require_relative "./board"
require_relative "./player"

class Engine

  POSITION = %w[1 2 3 4 5 6 7 8 9]
  INFO = <<Doc

Le joueur 1 a "X" et le joueur 2 a "O"

Doc

  def display_info
    puts INFO
  end

  def start(x_player, o_player, board)


    puts "Est-ce que #{x_player.name} veut jouer en premier?"
    puts "veuillez taper la lettre O pour Oui et n'importe quoi d'autre pour Non"
    ans = gets.chomp

    if %w[O o].include?(ans)
      current_player = x_player
    else
      current_player = o_player
    end

    (1..9).each do
      if current_player == x_player
        play(current_player, board)
        current_player = o_player
      else
        play(current_player, board)
        current_player = x_player
      end
    end

  end
  
  def stop
    puts "\nÉgalité\n\n"
  end

  def play(current_player, board)
      flag = true

      while flag do
        puts ""
        puts "Où est-ce que tu veux te placer #{current_player.name} entre 1 et 9?"
        print "> "
        position = gets.chomp

        if !POSITION.include?(position)
          puts "\nTsy poinsa, entre une valeur entre 1 et 9\n"
          flag = true
        elsif %w[X O].include?board.positions_with_values[position]
          puts "\nEfa misy eo aaan\n"
          flag = true
        else
          flag = false
        end
      end

      current_player.move(board, position, self)
    
  end

  def check_winner(board)
    x_count = 0
    o_count = 0
    Board::WINNING_PLACES.each do |winning_place|
      winning_place.each do |index|
        if board.positions_with_values["#{index}"] == "X"
          x_count = x_count + 1
        elsif board.positions_with_values["#{index}"] == "O"
          o_count = o_count + 1
        end
      end
      if x_count == 3 or o_count == 3
        break
      else
        x_count = 0
        o_count = 0
      end
    end
    if x_count == 3
      return "X no mandresy"
    elsif o_count == 3
      return "O no mandresy"
    end
    return "No One"
  end

  def display_winner(name)
      puts "Bravo #{name} tu as gagné ☻ \n\n"
      exit
  end

end

engine = Engine.new
engine.display_info
puts "Comment s'appelle le joueur1 ?"
x_player = Player.new("X", gets.chomp)
puts "Comment s'appelle le joueur 2 ?"
o_player = Player.new("O", gets.chomp) 
board    = Board.new

engine.start(x_player, o_player, board) 
engine.stop 
