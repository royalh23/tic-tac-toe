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
end

tic_tac_toe = TicTacToe.new
tic_tac_toe.run_game
