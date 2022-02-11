require 'pry-byebug'

class TicTacToe
  @@game_running = true

  def run_game
    while @@game_running
      puts "Welcome to the Tic Tac Toe game! Let's get started."
      puts 'What is the name of the first player?'
      first_player_name = gets.chomp
      puts 'Please choose between "X" and "O".'

      # Check if the user has entered the correct letter.
      while first_player_choice = gets.chomp
        first_player_choice.upcase!
        if first_player_choice == 'O' || first_player_choice == 'X'
          break
        else
          puts 'Please enter a valid letter.'
        end
      end
      @first_player = FirstPlayer.new(first_player_name, first_player_choice)
      puts 'What is the name of the second player?'
      second_player_name = gets.chomp

      # Determine the second player's choice based on that of the 1st player
      second_player_choice = if @first_player.choice == 'X'
                               'O'
                             else
                               'X'
                             end
      @second_player = SecondPlayer.new(second_player_name, second_player_choice)
      puts "The second player's choice is '#{@second_player.choice}' because" \
            " of the first player's choice."

      # Show the game board
      @game_board = GameBoard.new
      @game_board.draw_game_board

      # Play rounds
      until @@game_running == false
        first_player_round
        second_player_round if @@game_running
      end
    end
  end

  def first_player_round
    # Ask the first player to enter a number
    ask_first_player

    # Show the game board again
    @game_board.draw_game_board

    # Check for win case
    check_win_case
  end

  def second_player_round
    # Ask the second player to enter a number
    ask_second_player

    # Show the game board again
    @game_board.draw_game_board

    # Check for win case
    check_win_case
  end

  def check_win_case
    if @game_board.game_board_array[0] == @game_board.game_board_array[1] &&
        @game_board.game_board_array[1] == @game_board.game_board_array[2]
      puts 'Win!'
      @@game_running = false
    elsif @game_board.game_board_array[0] == @game_board.game_board_array[3] &&
      @game_board.game_board_array[3] == @game_board.game_board_array[6]
      puts 'Win!'
      @@game_running = false
    elsif @game_board.game_board_array[6] == @game_board.game_board_array[7] &&
      @game_board.game_board_array[7] == @game_board.game_board_array[8]
      puts 'Win!'
      @@game_running = false
    elsif @game_board.game_board_array[2] == @game_board.game_board_array[5] &&
      @game_board.game_board_array[5] == @game_board.game_board_array[8]
      puts 'Win!'
      @@game_running = false
    elsif @game_board.game_board_array[1] == @game_board.game_board_array[4] &&
      @game_board.game_board_array[4] == @game_board.game_board_array[7]
      puts 'Win!'
      @@game_running = false
    elsif @game_board.game_board_array[3] == @game_board.game_board_array[4] &&
      @game_board.game_board_array[4] == @game_board.game_board_array[5]
      puts 'Win!'
      @@game_running = false
    elsif @game_board.game_board_array[0] == @game_board.game_board_array[4] &&
      @game_board.game_board_array[4] == @game_board.game_board_array[8]
      puts 'Win!'
      @@game_running = false
    elsif @game_board.game_board_array[2] == @game_board.game_board_array[4] && 
      @game_board.game_board_array[4] == @game_board.game_board_array[6]
      puts 'Win!'
      @@game_running = false
    end
  end

  def ask_first_player
    # Ask the first player to enter a number
    puts "\n#{@first_player.name}, please enter a number to place" \
          " '#{@first_player.choice}'."

    while first_player_number_choice = gets.chomp.to_i
      if @game_board.game_board_array.include?(first_player_number_choice)
        @game_board.game_board_array[first_player_number_choice - 1] = @first_player.choice
        break
      else
        puts 'Please enter a valid number.'
      end
    end
  end

  def ask_second_player
    puts "\n#{@second_player.name}, please enter a number to place" \
          " '#{@second_player.choice}'."

    while second_player_number_choice = gets.chomp.to_i
      if @game_board.game_board_array.include?(second_player_number_choice)
        @game_board.game_board_array[second_player_number_choice - 1] = @second_player.choice
        break
      else
        puts 'Please enter a valid number.'
      end
    end
  end
end

class FirstPlayer
  attr_reader :name, :choice

  def initialize(name, choice)
    @name = name
    @choice = choice
  end
end

class SecondPlayer
  attr_reader :name, :choice

  def initialize(name, choice)
    @name = name
    @choice = choice
  end
end

class GameBoard
  attr_reader :game_board_array

  def initialize
    @game_board_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def draw_game_board
    puts "
       #{@game_board_array[0]} | #{@game_board_array[1]} | #{@game_board_array[2]}
      ---+---+---
       #{@game_board_array[3]} | #{@game_board_array[4]} | #{@game_board_array[5]}
      ---+---+---
       #{@game_board_array[6]} | #{@game_board_array[7]} | #{@game_board_array[8]}"
  end
end

tic_tac_toe = TicTacToe.new
tic_tac_toe.run_game
