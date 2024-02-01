# frozen_string_literal: true

require_relative 'display'
require_relative 'text_content'
require_relative 'game_logic'

# Creates version of the game for a human player as the code breaker
class HumanPlayer
  include TextContent
  include Display
  include GameLogic

  def initialize
    @code_to_break = 4.times.map { rand(1..6) }
  end

  def play_game
    puts player_instructions
    puts "# Computer generated #{@code_to_break}" # to be removed later
    # adding 12 turn loop
    12.times do |turn|
      puts "Turn #{turn + 1}. #{ingame_text('enter_4_numbers')}"
      # method to get 4 numbers from the user:
      user_guess = user_four_numbers
      # quit is the input is 'q'
      if user_guess == 'q'
        print ingame_text('break')
        break
      end
      user_guess = user_guess.split('').map(&:to_i)
      show_code(user_guess)
      if game_won?(@code_to_break, user_guess) # || user_wants_to_quit?
        puts ingame_text('user_won')
        break
      end
      compare_codes(@code_to_break, user_guess)
    end
  end
end
