class TicTacToe
  def run_game
    while true
      puts 'What is the name of the first player?'
      first_player_name = gets.chomp
      puts 'Please choose between "X" and "O".'
      first_player_choice = gets.chomp.upcase
      first_player = FirstPlayer.new(first_player_name, first_player_choice)
      puts 'What is the name of the second player?'
      second_player_name = gets.chomp
      if first_player_choice == 'X'
        second_player_choice = 'O'
      else
        second_player_choice = 'X'
      end
      second_player = SecondPlayer.new(second_player_name, second_player_choice)
      puts "The second player's choice is '#{second_player_choice}' because" \
            " of the first player's choice."
      game_board = GameBoard.new
      game_board.draw_game_board
      break
    end
  end
end

class FirstPlayer
  def initialize(name, choice)
    @name = name
    @choice = choice
  end
end

class SecondPlayer
  def initialize(name, choice)
    @name = name
    @choice = choice
  end
end

class GameBoard
  def draw_game_board; end
end

tic_tac_toe = TicTacToe.new
tic_tac_toe.run_game
