# frozen_string_literal: true

# The board in which the tic-tac-toe game is played
class Board
  attr_reader :game_over, :result

  def initialize
    @board_state = Array.new(3) { Array.new(3) }
    @p1_turn = true
  end

  def take_turn
    change_board
    check_if_result
    print_board
    @p1_turn = !@p1_turn
  end

  private

  attr_writer :game_over

  def change_board
    player_symbol = @p1_turn ? 'X' : 'O'
    puts @p1_turn ? 'player 1, input a number from 1 to 9' : 'player 2, input a number from 1 to 9' # check for not int
    input_square = gets.chomp.to_i
    if @board_state[(input_square / 3.01).floor][(input_square % 3) - 1].nil?
      @board_state[(input_square / 3.01).floor][(input_square % 3) - 1] = player_symbol
    end
  end

  def print_board
    puts
    @board_state.each_with_index do |row, row_index|
      print '|'
      row.each_with_index do |_value, column_index|
        if @board_state[row_index][column_index].nil?
          print ' '
        else
          print @board_state[row_index][column_index]
        end
        print '|'
      end
      puts
    end
  end

  def end_game
    self.game_over = true
    @result = @p1_turn ? 'p1' : 'p2'
  end

  def check_if_result
    unless @board_state.flatten.include?(nil)
      self.game_over = true
      @result = 'draw'
    end

    [0..2].each do |i|
      if @board_state[i][0] == @board_state[i][1] && @board_state[i][1] == @board_state[i][2] && @board_state[i][0]
        end_game
      elsif @board_state[0][i] == @board_state[1][i] && @board_state[1][i] == @board_state[2][i] && @board_state[0][i]
        end_game
      end
    end
    if @board_state[0][0] == @board_state[1][1] && @board_state[1][1] == @board_state[2][2] && @board_state[0][0]
      end_game
    elsif @board_state[0][2] == @board_state[1][1] && @board_state[1][1] == @board_state[2][0] && @board_state[0][2]
      end_game
    end
  end
end

# print rules
# get the names of both players and say 'p1', your turn
game_board = Board.new
game_board.take_turn until game_board.game_over

puts 'GAME OVER!'
if game_board.result == 'draw'
  puts 'The game is a draw!'
else
  puts "#{game_board.result} is the winner!" # customize message
end
