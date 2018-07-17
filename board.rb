#----------------------------------------------
# TicTacToe game in Ruby Language
# author: [Sanosh Wadghule, santosh.wadghule@gmail.com]
# copyright: (c) 2011 Santosh Wadghule
#----------------------------------------------

class Board

  attr_accessor :info, :positions_with_values

  WINNING_PLACES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]


  def initialize # board position starts from 1 to 9
    @positions_with_values = {"1" => "1", "2" => "2", "3" => "3",
                              "4" => "4", "5" => "5", "6" => "6",
                              "7" => "7", "8" => "8", "9" => "9"}
  end

  def display
    puts ""
    puts " #{self.positions_with_values["1"]} | #{self.positions_with_values["2"]} | #{self.positions_with_values["3"]} "
    puts "____________"
    puts " #{self.positions_with_values["4"]} | #{self.positions_with_values["5"]} | #{self.positions_with_values["6"]} "
    puts "____________"
    puts " #{self.positions_with_values["7"]} | #{self.positions_with_values["8"]} | #{self.positions_with_values["9"]} "
    puts ""
  end

end


