# frozen_string_literal: true

# put info about player, names, etc.

# The board in which the tic-tac-toe game is played
class Board
  def initialize
    @board_state = Array.new(3) { Array.new(3) }
  end

  def take_turn(player)
    change_board(player)
    print_board
  end

  private

  def change_board(player)
    player_symbol = player == 'player1' ? 'X' : 'O'
    puts 'input a number from 1 to 9' # check for not int
    input_square = gets.chomp.to_i
    @board_state[(input_square / 3.01).floor][(input_square % 3) - 1] = player_symbol
  end

  def print_board
    pp @board_state
  end
end

game_board = Board.new
game_board.take_turn('player1')
