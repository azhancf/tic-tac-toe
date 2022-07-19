# frozen_string_literal: true

# put info about player, names, etc.

# The board in which the tic-tac-toe game is played
class Board
  attr_reader :game_over

  def initialize
    @board_state = Array.new(3) { Array.new(3) }
    @game_over = false
    @p1_turn = true
  end

  def take_turn
    change_board
    check_if_winner
    print_board
    @p1_turn = !@p1_turn
  end

  private

  attr_writer :game_over

  def change_board
    player_symbol = @p1_turn ? 'X' : 'O'
    puts 'input a number from 1 to 9' # check for not int
    input_square = gets.chomp.to_i
    if @board_state[(input_square / 3.01).floor][(input_square % 3) - 1].nil?
      @board_state[(input_square / 3.01).floor][(input_square % 3) - 1] = player_symbol
    end
  end

  def print_board # make more fancy
    pp @board_state
  end

  def check_if_winner
    for i in 0..2
      if @board_state[i][0] == @board_state[i][1] && @board_state[i][1] == @board_state[i][2] && @board_state[i][0]
        self.game_over = true
      elsif @board_state[0][i] == @board_state[1][i] && @board_state[1][i] == @board_state[2][i] && @board_state[0][i]
        self.game_over = true
      end
    end
    if @board_state[0][0] == @board_state[1][1] && @board_state[1][1] == @board_state[2][2] && @board_state[0][0]
      self.game_over = true
    elsif @board_state[0][2] == @board_state[1][1] && @board_state[1][1] == @board_state[2][0] && @board_state[0][2]
      self.game_over = true
    end
  end
end

game_board = Board.new
game_board.take_turn until game_board.game_over

puts 'GAME OVER!'
# print winner